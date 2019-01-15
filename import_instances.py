# coding:utf-8
import googleapiclient.discovery
import sys
from jinja2 import Template
import json
# gérer l'authentification
# récupérer la liste des instances ( récupérer toutes les infos pour faire la template tf)
# récupérer les boot disk
# récupérer les autres disk
# exectuter les templates terraform ( render + print )
# lancer le script python et écrire la sortie dans un fichier main.tf
# lancer terraform

# step 1 faire une instance simple et la relancer avec terraform 
# step 2 complexifier l'instance

#4 COMPARER LES INSTANCES sur drouot dev avec thom'as methods

#metadata_startup_script + metadata

#3atttention plusieurs interfaces pour netwooooooooork !



def authentification():
  return googleapiclient.discovery.build('compute', 'v1')

# [START list_instances]
#def list_instances(compute, project, zone , instance_status):
def list_instances(compute, project,instance_status):
  #result = compute.instances().list(project=project, zone=zone , filter ='status eq '+ instance_status).execute()
  result =  compute.instances().aggregatedList(project=project,filter ='status eq '+ instance_status).execute()
  instanceList = []
  for element in result['items']:
    if 'warning' not in result['items'][element]:
      for index in range(len(result['items'][element]['instances'])):
        instanceList.append(result['items'][element]['instances'][index])
  return instanceList
  #return result['items'] if 'items' in result else None
# [END list_instances]

# Function to retrieve information about instances
def proccess_instances_info (instanceList,compute,project):
  
  instances_infos = []
  i = 0
  for instance in instanceList:
    disk_name = instance['disks'][0]['source'].rsplit('/', 1)[-1]
    result = compute.disks().get(project=project, zone=instance['zone'].rsplit('/', 1)[-1], disk=disk_name).execute()
    instances_infos.append({
      'name':instance['name'],
      'machine_type':instance['machineType'].rsplit('/', 1)[-1],
      'zone': instance['zone'].rsplit('/', 1)[-1],
      'image': result['sourceImage'],
      'network':instance['networkInterfaces'][0]['network'].rsplit('/', 1)[-1],
      'disk_size':result['sizeGb'],
      'device_name':disk_name,
      'auto_delete': instance['disks'][0]['autoDelete']
      #'service_account_email':instance['serviceAccounts'][0]['email'],
      #'scopes':json.dumps(instance['serviceAccounts'][0]['scopes'])
      
            })

    if ('items' in instance['tags']):
        instances_infos[i].update({'tags': json.dumps(instance['tags']['items'])})

    if ('labels' in instance):
        instances_infos[i].update({'labels':instance['labels']})

    if (len(instance['disks']) != 1):
      attached_disk_list = []
      for disk in instance['disks'][1:]:
          attached_disk_list.append({'source' : disk['source'] , 'mode' : disk['mode'] })
      instances_infos[i].update({'attached_disk':attached_disk_list})

    if  ('natIP' in instance['networkInterfaces'][0]['accessConfigs'][0]):
        instances_infos[i].update({'ip':instance['networkInterfaces'][0]['accessConfigs'][0]['natIP']})
    if ('serviceAccounts' in instance):
      instances_infos[i].update({'service_account_email':instance['serviceAccounts'][0]['email'],'scopes':json.dumps(instance['serviceAccounts'][0]['scopes'])}) 
    i += 1
    
  return instances_infos

  #rajouter au fur et à mesure ce qui existe
def render_terraform(instances_infos,filename):
  with open('instances.tf.j2') as file_:
    template = Template(file_.read())
  terraform_code = template.render(instances_infos =instances_infos)
  with open(filename, "w") as fh:
    fh.write(terraform_code)
  

def main(project):
  compute = authentification()
  
  #try:
  instances_infos_RUNNING = proccess_instances_info (list_instances(compute,project,instance_status="RUNNING"),compute,project)

  instances_infos_TERMINATED = proccess_instances_info (list_instances(compute,project,instance_status="TERMINATED"),compute,project)
  #except TypeError:
    #print("No instance is running on your project")
  render_terraform(instances_infos_RUNNING,filename = "instances_Running.tf" )
  render_terraform(instances_infos_TERMINATED, filename = "instances_Terminated.tf")


if __name__ == '__main__':
  main(sys.argv[1])
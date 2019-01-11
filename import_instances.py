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

# atttention plusieurs interfaces pour netwooooooooork !


def authentification():
  return googleapiclient.discovery.build('compute', 'v1')

# [START list_instances]
def list_instances(compute, project, zone , instance_status):
  result = compute.instances().list(project=project, zone=zone , filter ='status eq '+ instance_status).execute()
  print(result)
  return result['items'] if 'items' in result else None
# [END list_instances]

# Function to retrieve information about instances
def proccess_instances_info (list_instances,compute,project,zone , instance_status):
  instancesList = list_instances (compute,project,zone,instance_status)
  instances_infos = []
  i = 0
  for instance in instancesList:
    instances_infos.append({
      'name':instance['name'],
      'machine_type':instance['machineType'].rsplit('/', 1)[-1],
      'zone': instance['zone'].rsplit('/', 1)[-1],
      'image': instance['disks'][0]['licenses'][0].rsplit('/', 1)[-1],
      'network':instance['networkInterfaces'][0]['network'].rsplit('/', 1)[-1]
            })
    if ('items' in instance['tags']):
        instances_infos[i].update({'tags': json.dumps(instance['tags']['items'])})
        
    if  ('natIP' in instance['networkInterfaces'][0]['accessConfigs'][0]):
        instances_infos[i].update({'ip':instance['networkInterfaces'][0]['accessConfigs'][0]['natIP']})    
    i += 1
    
  return instances_infos

  #rajouter au fur et à mesure ce qui existe
def render_terraform(instances_infos,filename):
  with open('instances.tf.j2') as file_:
    template = Template(file_.read())
  terraform_code = template.render(instances_infos =instances_infos)
  with open(filename, "w") as fh:
    fh.write(terraform_code)
  
# écriture du tf sur le disssssssssssssssssssssssssssssssssssk

def main(project,zone):
  compute = authentification()
  
  #try:
  instances_infos_RUNNING = proccess_instances_info (list_instances,compute,project,zone,instance_status="RUNNING")

  instances_infos_TERMINATED = proccess_instances_info (list_instances,compute,project,zone,instance_status="TERMINATED")
  #except TypeError:
    #print("No instance is running on your project")
  render_terraform(instances_infos_RUNNING,filename = "instances_Running.tf" )
  render_terraform(instances_infos_TERMINATED, filename = "instances_Terminated.tf")


if __name__ == '__main__':
  main(sys.argv[1],sys.argv[2])
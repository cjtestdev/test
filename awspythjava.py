#!/usr/bin/python

import sys, getopt, os, time

# access keys are environment vars
from boto.ec2.connection import EC2Connection
conn = EC2Connection()

def get_script(filename='user_data_script.sh'):
    readscript = open(filename).read()
    return readscript

# script must be called with args for ec2 key and OS type to be provisioned (awspythjava.py -k anykey -o ubuntu/windows)
def main(argv):
   ec2_autogen_key = ''
   ostype = ''
   try:
      opts, args = getopt.getopt(argv,"hk:o:",["ikey=","osver="])
   except getopt.GetoptError:
      print 'awspythjava.py -k <ec2 key> -o <OS type 1>'
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print 'awspythjava.py -k <ec2 key> -o <OS type 2>'
         sys.exit()
      elif opt in ("-k", "--ikey"):
         ec2_autogen_key = arg
      elif opt in ("-o", "--osver"):
         ostype = arg	
   dir = os.getcwd()

   createdir = dir + "/.ssh/"
   if not os.path.exists(createdir):
   		os.makedirs(createdir)

   fname = dir + "/.ssh/" + ec2_autogen_key + ".pem"
   print fname
   if os.path.isfile(fname):
                print "%s file already exits" % (ec2_autogen_key)
   else:
             if ec2_autogen_key == '':
             	ec2_autogen_key = 'default_ec2_key'
             key_pair = conn.create_key_pair(ec2_autogen_key)
	     dir = dir + '/.ssh'
	     key_pair.save(dir)   

   print ec2_autogen_key

   if ostype == 'ubuntu':
   		# launch ubuntu bash script within user_data
   		# ssh access security group (launch-wizard-1)
   		get_script_os = 'user_data_script.sh'
   		image_id_os = 'ami-d05e75b8'     # Ubuntu 14.04 image Id
   
   if ostype == 'windows':
   		# launch windows powershell script within user_data
		get_script_os = 'user_date_script.ps1'   	
   		image_id_os =  'ami-cc93a8a4'  #(windows 8 image ID)
   
   # ssh access security group (launch-wizard-1)		
   reservation = conn.run_instances(image_id=image_id_os, key_name=ec2_autogen_key, instance_type='t2.micro', security_groups=['launch-wizard-1'], user_data=get_script(get_script_os),)

   # Wait a minute or two while it boots
   for r in conn.get_all_instances():
      if r.id == reservation.id:
         break

   instance = reservation.instances[0]

   # Wait for instance to come up
   while instance.state != 'running':
        instance.update()
        print instance.state
        time.sleep(3)

   print instance.public_dns_name

   print '----------------------------------------------------------'
   print 'To login to your instance please enter the below command:'
   print "ssh -i .ssh/%s.pem ubuntu@%s" % (ec2_autogen_key, instance.public_dns_name)

if __name__ == "__main__":
   main(sys.argv[1:])

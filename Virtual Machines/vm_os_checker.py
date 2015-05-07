#!/usr/bin/python
#Quam Sodji 2015
#Displays the OS of discovered virtual machines

import subprocess
#Search for VMs 
vmware_files = subprocess.check_output(["find","/Users","-name","*.vmx"])
vbox_files = subprocess.check_output(["find","/Users","-name","*.vbox"])
parallels_files = subprocess.check_output(["find","/Users","-name","VmInfo.pvi"])

#Create list with the found VMs
vmware_files = vmware_files.split("\n")
vmware_files = filter(None, vmware_files)
vbox_files = vbox_files.split("\n")
vbox_files = filter(None, vbox_files)
parallels_files = parallels_files.split("\n")
parallels_files = filter(None, parallels_files)
#print vmware_files
#print vbox_files
#print parallels_files
results = []

def what_vm(): #Check which VMs are present
    if vmware_files == [] and vbox_files == [] and parallels_files == []:
        return "No VM Found"
    elif vmware_files == [] and vbox_files == [] and parallels_files != []:
        return "Parallels Found"
    elif vmware_files == [] and vbox_files != [] and parallels_files == []:
        return "Vbox Found"
    elif vmware_files == [] and vbox_files != [] and parallels_files != []:
        return "Vbox and Parallels Found"
    elif vmware_files != [] and vbox_files == [] and parallels_files == []:
        return "VMware found"
    elif vmware_files != [] and vbox_files == [] and parallels_files != []:
        return "VMware and Parallels Found" 
    elif vmware_files != [] and vbox_files != [] and parallels_files == []:
        return "VMware and Vbox Found"   
    elif vmware_files != [] and vbox_files != [] and parallels_files != []:
        return "VMware,Vbox and Parallels Found"
    else:
        return "Error..."

def found_vmware(): #Returns found Vms OS
    vm_found = []
    vmware_config =[]
    for i in vmware_files:
        if i.endswith(".vmx"):
            vmware_config.append(i)
    for t in vmware_config:
        tre = open(t)
        for line in tre:
            if line.startswith("guest"):
                vm_os = line.strip()[11:-1]
                vm_os = vm_os.lower()
                vm_found.append(vm_os)

    vm_found = ('\n').join(vm_found)
    return "%s"%vm_found

def found_vbox():  #Returns found Vms OS
    vbox_mod = []
    vbox_os = []
    for i in vbox_files:
        read_vbox = open(i)
        for line in read_vbox:
            if "OSType=" in line:
                vbox_mod.append(line)

    for some in vbox_mod:
        some = some.strip()
        vbox_cut = some.split()
        for b in vbox_cut:
            if "OSType=" in b:
                vbox_os.append(b[8:-1])
    vbox_os = ('\n').join(vbox_os)
    return "%s"%vbox_os

def found_para(): #Returns found Vms OS
    para_res = []
    cleanup =[]
    para_mod = []
    for a in parallels_files:
        read_pars = open(a)
        for bib in read_pars:
            if "RealOsType" in bib:
                para_mod.append(bib.strip())
    for g in para_mod:
        gt = g.split()
        gt = gt[1:2:]
        cleanup.append(gt)
    for m in cleanup:
        t = m[0].translate(None,",")
        para_res.append(t)
    para_res = ('\n').join(para_res)
    return "%s" %para_res

#Output logic based on found Vms --> Info is then displayed in Casper
if what_vm() == "No VM Found":
    results = "No VM Found"
    print "<result>%s</result>"%results

elif what_vm() == "Parallels Found":
    results.append("Parallels")
    results.append(found_para())
    results = ('\n').join(results)
    print "<result>%s</result>"%results

elif what_vm() == "Vbox Found":
    results.append("VirtualBox")
    results.append(found_vbox())
    results = ('\n').join(results)
    print "<result>%s</result>"%results

elif what_vm() == "Vbox and Parallels Found":
    results.append("Parallels")
    results.append(found_para())
    results.append("\nVirtualBox")
    results.append(found_vbox())
    results = ('\n').join(results)
    print "<result>%s</result>"%results

elif what_vm() == "VMware found":
    results.append("VMware Fusion")
    results.append(found_vmware())
    results = ('\n').join(results)
    print "<result>%s</result>"%results

elif what_vm() == "VMware and Parallels Found":
    results.append("Parallels")
    results.append(found_para())
    results.append("\nVMware Fusion")
    results.append(found_vmware())
    results = ('\n').join(results)
    print "<result>%s</result>"%results

elif what_vm() == "VMware and Vbox Found":
    results.append("VirtualBox")
    results.append(found_vbox())
    results.append("\nVMware Fusion")
    results.append(found_vmware())
    results = ('\n').join(results)
    print "<result>%s</result>"%results

elif what_vm() == "VMware,Vbox and Parallels Found":
    results.append("Parallels")
    results.append(found_para())
    results.append("\nVirtualBox")
    results.append(found_vbox())
    results.append("\nVMware Fusion")
    results.append(found_vmware())
    results = ('\n').join(results)
    print "<result>%s</result>"%results

else:
    results = what_vm()
    print "<result>%s</result>"%results


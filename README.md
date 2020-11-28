# Dictum-cli

The Dictum-CLI assists users with building Dictum workspaces. 

dictum-cli subcommands:  

init: Initialize Dictum workspace by performing the follwing:
          1. Create .state directory  
          2. Seed .state directory with example state file and namespace  
          3. Create Dictum framework directory structure under workspace root  

define: open the state file in vi
          
prep-delete: Marks the DSM workspace to delete the environment on next DSM run

run: Run DSM on an initialized workspace

help: open a help dialog to assist with using Dictum-cli and Dictum-SM

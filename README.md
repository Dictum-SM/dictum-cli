# Dictum-cli

The Dictum-CLI assists users with managing Dictum workspaces. 

# Installation

Download the latest release. Make executable and move to a location listed in the current user's $PATH.

# Usage

dictum-cli subcommands:  

define: open the state file in vi

help: open a help dialog to assist with using Dictum-cli and Dictum-SM

init: Initialize Dictum workspace by performing the follwing:
          1. Create .state directory  
          2. Seed .state directory with example state file and namespace  
          3. Create Dictum framework directory structure under workspace root  

          
prep-delete: Marks the DSM workspace to delete the environment on next DSM run

reset: Returns a Dictum workspace to normal following an environment deletion.

run: Run DSM on an initialized workspace

version: Print tinstalled version of Dictum-CLI

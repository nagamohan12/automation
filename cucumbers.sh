#!/bin/bash         
clear
echo "Cucumber Automation Starts"
cd
cd /home/administrator/RubymineProjects/test_automation_cyclos
CUSTOM_REPORT=true rake selected_scenario
echo "Cucumber Ends"


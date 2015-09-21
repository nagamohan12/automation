#!/bin/bash         
clear
echo "Parallel Cucumber Automation Starts"
cd
cd RubymineProjects/test_automation_cyclos/
cd /home/administrator/RubymineProjects/test_automation_cyclos
parallel_cucumber features
echo "Parallel Cucumber Ends"


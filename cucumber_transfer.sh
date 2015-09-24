#!/bin/bash         
clear
echo "Cucumber Automation Starts"
cd
cd /home/administrator/RubymineProjects/test_automation_cyclos
bundle install
export GEM_PATH=/var/lib/gems/2.1.0/gems/
cucumber features/transfer_amount.feature -f pretty -f json -o /home/administrator/RubymineProjects/test_automation_cyclos/json_reports/results.json
echo "Cucumber Ends"


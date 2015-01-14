First lets create the extension: 

- Go to 'Settings'; 
- Click 'Computer Management' in the left menu; 
- Click 'Extension Attributes' in the center of the page; 
- Click "+" to create a new Extension Attribute; 
- Fill in a name (example:"Energy Saver Profile") for the Extension Attribute; 
- Set 'Date Type' to 'String'; 
- Set 'Inventory Display' to the page you want to see the information when showing the computer details; 
- Set 'Input Type' to 'Script'; 
- Beneath 'Script' select 'OSX'; 
- Copy and paste the script into the script area
- Click 'Save' to save the extension. 


Now lets create a smart group to show the computers that have the 'Energy Saver Profile' installed: 

- Go to 'Settings'; 
- Click 'Computer Management' in the left menu; 
- Click 'Smart Computer Groups'; 
- Click '+' to create a new smart group; 
- Give the smart group a name (example:"Energy Saver Profile") 
- Click 'Criteria'; 
- Click '+' to add a Criteria; 
- Search in the list for the name given to the extension attribute created before (If it is not shown click 'choose' behind 'All Criteria'. This will expand the list!); 
- Select the operator 'Like'; 
- Enter the name of the Configuration profile under the option 'value' (example:"Energy Saver Profile"); 
- Click 'Save' to save the smart group. 

Now, when you press the 'view' button you will see all computers that have the Configuration Profile (example 'Energy Saver Profile'). 

To see which computers do not have a Configuration Profile installed the Criteria of the smart group has to be changed to what ever is wanted. 

Take into account that the computers need to check in before the information will be updated!
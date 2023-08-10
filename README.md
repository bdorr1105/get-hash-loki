# get-hash-loki
A bash script that is meant to work with Loki IOC and YARA scanner. It is meant to scan directories that you provide with user input, and present a list of files that you can get the hash values from. Once it gets teh hash value, it prompts you if you want to add it to Loki's IOCs to make the process more efficient

## Usage
To use this script, follow the steps below:

### Clone this repository to your local machine:

`git clone https://github.com/bdorr1105/get-hash-loki.git`

### Change to the project directory:

`cd get-hash-loki`

### Make the script executable:

`chmod +x get-hash-loki.sh`

Run the script sudo/root privs:

`sudo ./get-hash-loki.sh` 

## Follow the prompts to scan the directory you want to get the file hashes

Please note: You will be prompted to append the hashes th whereever you would like, but the conecept is to be compatible with Loki Simple IOC and YARA scanner. You do not have to do this, you can simply use this just to get the file hashes

| :point_up:    | Please note that running this script may require administrative privileges, so ensure that you have the necessary permissions before executing it. |
|---------------|:---------------------------------------------------------------------------------------------------------------------------------------------------|

## See it in Action

Screenshots
![get-hash-1](https://github.com/bdorr1105/get-hash-loki/assets/12386911/a01d4251-e8fe-4d86-a0a7-639283f2bdb9)

![get-hash-2](https://github.com/bdorr1105/get-hash-loki/assets/12386911/4b06c5b4-7f28-468c-8260-47f7841dd13a)


## Contributions
Contributions to this project are welcome. If you find any issues or have suggestions for improvements, please feel free to create a pull request or submit an issue on the GitHub repository.

## License
This script is licensed under the GNU License. Please review the license file for more information.

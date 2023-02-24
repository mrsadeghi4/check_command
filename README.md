#### Objective:
The objective of this script is to check whether a given command has executed successfully or not. The script provides
the functionality to set the interval time and number of attempts to check for successful execution.

## How to use:
1- Clone or download the repository to your local machine.
2- Open the terminal and navigate to the directory where the script is saved.
3- Set the environment variables for the interval time and number of attempts (optional).
4- Run the script with the command you want to check as the argument. For example: ./check_command.sh ls
5- The script will output whether the command executed successfully or not.

## Parameters:

Provide a detailed explanation of the parameters that can be used with the script. For example:

    'INTERVAL': The time interval (in seconds) between each attempt to check for successful execution. Default value is 15 seconds.
    'TRIES': The number of attempts to check for successful execution. Default value is 10 attempts.

If these parameters are not provided as environment variables, the script will use default values. If no values are provided, 
the script will use local variables.

## Example:
To check if the command ls has executed successfully with an interval of 20 seconds and 5 attempts, run the following command:

```
INTERVAL=20 TRIES=5 ./check_command.sh ls
```

To check if the command npm start has executed successfully with default parameters, run the following command:


```
./check_command.sh npm start
```

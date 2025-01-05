# Custom `ls` Command

This is a simplified implementation of the `ls` command in Python, intended as a learning exercise or backup in cases where the native `ls` command is unavailable.


## Exercise Summary: Building and Testing a Linux Command with ChatGPT


This exercise demonstrates the collaborative use of ChatGPT to design, implement, and test a custom Linux command (ls) entirely from scratch. The project simulates a scenario where the native ls command is unavailable, challenging the user and ChatGPT to rebuild the functionality and ensure it operates in a controlled environment. Here's an overview:


### Problem Definition:


Simulate the accidental removal of the ls command on an Ubuntu system.
Develop a lightweight replacement in Python, including commonly used options like -a, -l, and -la.


### Implementation:


Write the Python script for the custom ls command, handling file listing, hidden files, and detailed output.
Create a shell script to "install" the custom command in a Linux environment.


### Testing Strategy:

Use Docker to test the command in a clean and isolated Ubuntu environment.
Uninstall the native ls command in the Docker container to ensure the custom implementation works as expected.


### Key Achievements:

Writing a functional replacement for a core Linux utility.
Supporting standard flags like -a, -l, and combined flags like -la.
Testing the custom implementation in a reproducible Docker environment.


### Outcome:

The exercise showcases ChatGPT's ability to collaborate on technical challenges, from coding and debugging to environment setup and testing.
It also highlights the practicality of Docker for testing command-line tools in a clean, isolated environment.
This project provides a practical hands-on experience in system-level programming, containerized testing, and leveraging AI assistance for software development


## Features

- List files and directories in the current directory (default behavior).
- Support for hidden files with the `-a` flag.
- Detailed file information (permissions, size, modification date) with the `-l` flag.
- Combined flags like `-la` or `-al`.

## Installation


---


1. Build the project using Docker:
   ```bash
   docker build -t custom-ls .
   ```

2. Run the container:

   ```bash
   Copy code
   docker run -it custom-ls
   ```
   Inside the container, use the ls command as follows:
   ```bash
   Copy code
   ls          # List files
   ls -a       # Include hidden files
   ls -l       # Detailed listing
   ls -la      # Combined detailed and hidden files
   ```


---


## Testing


---


1. Create directories and files:
   ```bash
   Copy code
   mkdir test_dir
   touch test_dir/file1
   touch test_dir/.hidden_file
   ```

2. Use ls to verify the output:
   ```bash
   Copy code
   ls test_dir
   ls -a test_dir
   ls -la test_dir
   ```

## Contribution
Feel free to fork the repository and submit pull requests for improvements or additional features!

## License
This project is licensed under the MIT License. See `LICENSE` for more details.

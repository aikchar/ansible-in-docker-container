# Introduction

Create a container with Ansible installed. The *./ansible* directory is mounted
in it. Copy your Ansible stuff to the *./ansible* directory.

The main reason for creating and using this container is to make it easier for
users to use Ansible out of the box rather than having to worry about
installing it first.

# Environment Variables

Modify *docker-compose.yml* to map appropriate environment variables for your
needs.

Note, the PATH environment variable needs to have the path to Ansible included
so that it may work inside the container. Other than this cautionary note, feel
free to modify it as needed.

# Run the Container

Use ``make`` to manage the lifecycle of the container. It's used as an
interface to make routine actions easier to execute.

Start the container:

        $ make start

Start a Bournel shell session in the container:

        $ make shell

Stop the container:

        $ make stop

Clean up everything (destroy the container, remove Docker image, etc.):

        $ make clean

Get a list of all targets:

        $ make list

The *Makefile* is pretty simple so you can always refer to it for the actions
being executed behind the scenes.

# Run Ansible

The working directory in the container contains the Ansible stuff you've copied
over. Start using Ansible the way you would were it installed anywhere else.

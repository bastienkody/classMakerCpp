# classMakerCpp
Othodox Canonical Form classes declaration script for c++std98 (ecole 42 compliant)

## What is this?
Easy to use bash script that creates and populates both .hpp and .cpp files for a given class name.  
*	It implements Canonical form basics : 
	*	Default constructor
	*	Default destructor
	*	Copy constructor
	*	Copy operator  

*	But also few additionals :
	*	_name : std::string private member
	*	Parametric constructor (to _name)
	*	Getter on _name
	*	Setter on _name
	*	Ostream operator<< redefinition (it outputs _name)
	*	Includes for \<string\> and \<iostream\>


You want to modify some parts?  
Feel free to fork the repo, or simply modify the script after having it cloned. 

## Quick install (single use)
In the repo you want your class files : `git clone git@github.com:bastienkody/classMakerCpp.git`

## Permanent install (no sudo rights, ie. for 42 dumps)
*	You need a specific directory to store you binaries such as : `mkdir ~/bin`  
*	Clone the repo anywhere : `cd /tmp && git clone git@github.com:bastienkody/classMakerCpp.git`  
*	Copy the .sh in ~/.bin : `cd /tmp ; cp classMakercpp.sh ~/.bin`  
*	You may define an alias saved in your .\<shell\>rc : `echo "alias claspp='classMakercpp'" >> ~/.bashrc` (if zsh use : ~/.zshrc)  
*	Add your binaries repo to the PATH : `$PATH+=:~/bin`  
*	Make it permanent in your .\<shell\>rc : `echo "$PATH+=:~/bin" >> ~/.bashrc` (if zsh use : ~/.zshrc)

## Usage
*	Launch the script : `./classMakercpp.sh <ClassName>`  
*	ClassName is a mandatory argument : the name of the class  
*	This would create both ClassName.cpp and Classname.hpp in your current directory  


## Illustrations
Command line :  
![alt text](https://github.com/bastienkody/classMakerCpp/blob/main/images/command_line.png)  
.hpp :  
![alt text](https://github.com/bastienkody/classMakerCpp/blob/main/images/Animalhpp.png)  
.cpp :  
![alt text](https://github.com/bastienkody/classMakerCpp/blob/main/images/Animalcpp.png)  


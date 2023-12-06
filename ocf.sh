### Othodox Canonical Form script template for cpp std98 class declaration (and implemantation?) ###

#	usage, in a shell : ./ocf <ClassName> <[optional:]-m (for Makefile gen)>
#	create into the current directory : 
	#	ClassName.hpp, with : 
		#	header protection (not via pragma)
		#	include iostream (+sting?)
		#	Class definition yc : 
			#	default constructor
			#	parametized constructor (NO!! - but I like it .. - I dont care its not required - oh ... ok)
			#	copy constructor
			#	copy assignement operator
			#	destructor
			#	<< overload operator (out of the class bc can't redefine a iostream operator ; not required for ocf but usefull)
			#	member function that turn (=serialize) the instance into a readable string
	#	ClassName.cpp, with :
		#	include ClassName.hpp
		#	empty body function definition of const/dest-tructors
	#	Makefile (must be OPTIONAL) with : 
		#	default cpp makefile : flag + std98, build, all clean fclean re
		#	${name} set to ClassName


#! /bin/bash

touch $1.cpp $1.hpp

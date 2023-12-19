### Othodox Canonical Form script template for cpp std98 class declaration (and implemantation?) ###

#$1 = ClassName
#$2 = -m

#	usage, in a shell : ./ocf <ClassName> <[optional:]-m (for Makefile gen)>
#	create into the current directory : 
	#	ClassName.hpp, with : 
		#	header protection
		#	include : <iostream> & <string>
		# 	A single default attribute : 
			#	private string _name
			# 	getter on _name
			#	setter on _name
		#	Class ocf declaration including : 
			#	default constructor
			#	copy constructor
			#	copy assignement operator
			#	destructor
		# Customs
			#	parametric constructor (with a std::string name)
			#	<< overload operator for class to output its _name
	#	ClassName.cpp, with :
		#	include ClassName.hpp
		#	empty body function definition of const/dest-tructors
	#	Makefile (must be OPTIONAL) with : 
		#	default cpp makefile : flag + std98, build, all clean fclean re
		#	${name} set to ClassName


function print_usage()
{
	echo -e "Error : empty first argument.\nUsage : ./classMakerCpp <ClassName>"
}


#! /bin/bash

# arg $1 check
[[ -z $1 ]] && print_usage && exit 2

#	create the files
touch ${1}.cpp ${1}.hpp

#	populate hpp
{	echo -n "#ifndef ";	echo -n ${1} | tr '[a-z]' '[A-Z]' ; echo "_HPP"
	echo -n "#define ";	echo -n ${1} | tr '[a-z]' '[A-Z]' ; echo "_HPP"
	echo -e "\n#include<iostream>"
	echo -e "#include<string>\n"

	echo "class ${1}"
	echo '{'

	echo -e "\tpublic:"
	echo -e "\t\t${1}();"
	echo -e "\t\t~${1}();"
	echo -e "\t\t${1}(const std::string name);"
	echo -e "\t\t${1}(const ${1} & src);"
	echo -e "\t\t${1} & operator=(const ${1} & rhs);"
	echo -e "\t\tvoid\t\tsetName(std::string name);"
	echo -e "\t\tstd::string getName() const;"

	echo -e "\tprivate:"
	echo -e "\t\tstd::string _name;"
	echo -e "};\n"

	echo -e "std::ostream& operator<<(std::ostream& os, const ${1} &rhs);\n"
	echo "#endif" ; } > ${1}.hpp

#	populate cpp
{
	echo "#include\"${1}.hpp\""
	echo
	echo -e "//\tDefault constructor" ; echo -e "${1}::${1}()\n{\n\t_name = \"\";\n}"
	echo
	echo -e "//\tDefault destructor" ; echo -e "${1}::~${1}()\n{\n\n}" 
	echo
	echo -e "//\tParam constructor" ; echo -e "${1}::${1}(const std::string name)\n{\n\t_name = name;\n}" 
	echo
	echo -e "//\tCopy constructor (via copy operator)" ; echo -e "${1}::${1}(const ${1} & src)\n{\n\t*this = src;\n}" 
	echo
	echo -e "//\tCopy operator" ; echo -e "${1} & ${1}::operator=(const ${1} & rhs)"
	echo -e "{\n\tif(this != &rhs)\n\t{\n\t\t_name = rhs.getName();\n\t}\n\treturn (*this);\n}"
	echo
	echo -e "//\tGetter on _name" ; echo -e "std::string ${1}::getName() const\n{\n\treturn (_name);\n}"
	echo
	echo -e "//\tSetter on _name" ; echo -e "void ${1}::setName(std::string name)\n{\n\t_name = name;\n}"
	echo
	echo -e "//	os stream << redefinition" ; echo -e "std::ostream & operator<<(std::ostream& os, const ${1} &rhs)"
	echo -e "{\n\treturn (os << rhs.getName());\n} "
	echo ; } > ${1}.cpp

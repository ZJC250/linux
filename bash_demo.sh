#!/usr/bin/bash

#try: ./shelltest.sh 1 4 "abc def"
set -uo pipefail   # -e: 出错即退出；-u: 未定义变量报错；-o pipefail: 管道中任何错误都算失败
#set -e
set -E              # 确保 ERR trap 能传播到所有地方
#set -x		    # 执行前打印出即将执行的命令
trap 'echo "Error on line $LINENO. Command: $BASH_COMMAND"; exit 1' ERR


echo "Argument Demo:"
echo -e "\t-" "first arg:" '${0}'=${0}
echo -e "\t-" "second arg:" '${1}'=${1}
echo -e "\t-" "third arg:" '${2}'=${2}
echo -e "\t-" "fourth arg: \${3}=${3}"
echo -e "\t-" "argment number:" '${#}'=${#} "\n"

#difference between ${*} and ${@}:
echo -e "\t*" "No difference without quote, the last arg was splited into two args in exception:"
echo -e "\t-" "\${*}:"
for f in ${*}; do
    echo -e "\t\t-" $f
done

echo -e "\t-" "\${@}:"
for f in ${@}; do
    echo -e "\t\t-" $f
done

echo -e "\t*"  "Different with quote. \"\${*}\" join all args into one string,  \"\${@}\" would retain the last arg:"
echo -e "\t-" "\"\${*}\":"
for f in "${*}"; do
    echo -e "\t\t-" $f
done

echo -e "\t-" "\"\${@}\":"
for f in "${@}"; do
    echo -e "\t\t-" $f
done

echo -e "\t*" "Conclusion: \"\${@}\" is almost always prefered.\n"

echo -e "\n"

# bash don't support float point calc. error raised if any of ${1} and ${2} is float
echo "let/expr/\"(())\"/bc/awk command is used to arithmetic calculation:"
echo -e "\t-" "expr support integer input only:" "${1}+${2}=" $(expr ${1} + ${2})
let "a = 35" "b = 56"
#let need not variable expand oprand "${}"
let "c = a + b"
echo -e "\t-" "let support integer input only but more simple:" "c=" ${c}
#let is able to write several equaltions in same line
let "a++" "c = a + b"
echo -e "\t-" "let support self-increasement:" "a++=" $a, "c=" $c
#(()) operand is the most clear and simply synatx for integer calc
((d = a + b + c))
echo -e "\t-" '(()) is the most clear way:' "$a+$b+$c=" "$d"


#shell don't support float divide, so this statement would get '0'
a=23;b=45
echo -e "\t-" "float divide with expr:" "$a/$b=" $(expr $a / $b )

#this example shows how to get float result
echo -e "\t-" "float divide with bc:" "$b/$a=" $(echo "scale=2; $b/$a" | bc)
#or
echo -e "\t-" "float divide with awk:" "$b/$a=" $(awk 'BEGIN{printf "%.2f\n",'$b'/'$a'}')

echo -e "\n"

#initialize array var
echo "Array data-type demo:"
array0=()
array1=(value2 value1 value0)

#append elements to array
array2=(${array1[@]} value3)

#walkthrough of whole array
i=0
for f in ${array2[@]};
do
    echo -e "\t-" "array[${i}]:" ${f}
    #i=$(expr ${i} + 1)
    let "++i"
done    

# array support slice access also, syntax as ${a[@]:start_index:len}, leave len blank means to the end
echo "Array slice access syntax: \${a[@]:start_index:len}"
echo -e "\t-" "slice access of array[0]~array[1]: ${array2[@]:0:2}"
echo -e "\t-" "slice access of array[1]~end: ${array2[@]:1}"

echo -e "\n"

echo "\${?} is used to get previous command executing status: ${?}"

echo -e "\n"

#bash v.4.0+ support dict(known as assocaition array) as well
echo "Dict data-type demo:"
declare -A dict1 
dict1["key1"]="value1"
dict1["key2"]=2

# "3.5" and "dict1" will be treated as string even no quote on them
declare -A dict2=(
    ["key2"]=3.5
    ["key1"]=dict1
    ["key3"]="dict1/abc def"
    ["key4"]=array2
)

echo -e "\t-" "walk through of dict(be aware of quote on keys):"
for k in "${!dict1[@]}"; do
    echo -e "\t\t-" "dict1[${k}]=" ${dict1[$k]}
done

echo -e "\t-" "all value are treated as plain string no matter what type is it:"
for k in "${!dict2[@]}"; do
    echo -e "\t\t-" "dict2[${k}]=" ${dict2[$k]}
done

echo -e "\t-" "dict is a kind of array underlying but with no order:"

echo -e "\t\t-" "\${dict2[@]:0:1}=${dict2[@]:0:1}"
echo -e "\t\t-" "\${dict2[@]:1:2}=${dict2[@]:1:2}"

echo -e "\n"

#string split method
echo "String split/truncate demo:"
#get by start position and length
string="a-bc-def-ghij"
echo -e "\t-" "string = ${string}"
echo -e "\t-" "string:0:1 =" ${string:0:1}	#get 'a'
echo -e "\t-" "string:5:3 =" ${string:5:3}	#get 'def'

#remove specified substring(search pattern string from left to right)
#'##' means match as much as possible by substring
#so *'-' matchs 'a-bc-def-'
echo -e "\t-" "## search from left2right, match the last occurrence=" ${string##*'-'}	#get 'ghij'
#'#' means match as less as possible by substring
#so *'-' matchs 'a-'
echo -e "\t-" "# search from left2right, match the first occurrence=" ${string#*'-'}	#get 'bc-def-ghij'

#remove specified substring(search pattern string from right to left)
#'%%' means match as much as possible by substring
#so '-'* matchs  '-bc-def-ghij'
echo -e "\t-" "%% search from right2left, match the last occurrence=" ${string%%'-'*}	#get 'a'
#'%' means match as less as possible by substring
#so '-'* matchs '-ghij'
echo -e "\t-" "% search from right2left, match the last occurrence=" ${string%'-'*}


echo -e "\n"

#arithmetic and logic operator
echo "Arithmetic and logic operand demo:"

if [[ ${1} -gt ${2} ]]; then
    echo -e "\t-" "\"-gt\":" "$1 >= $2"
fi
#bash support both OP and oprand style arithmatic compare ">/-gt, </lt, >=/-ge, <=/-le, ==/-eq, !=/-ne"
#but for avoiding confusion with string compare, recommend to use specific arithmetic keyword '(())'
#  - use traditional test/[] command
if test $1 -lt $2 ; then
    echo -e "\t-" "test:" "traditional test command"
fi  
if [ $1 -lt $2 ]; then
    echo -e "\t-" "[]:" "traditional [] command."
fi
#  - use general condition exression keyword [[]]
if [[ $1 != $2 ]]; then
    echo -e "\t-" "[[]]:" "general condition expression"
fi    
#  - use specific arithmetic expression keyword (())
if (($1 <= $2)); then
    echo -e "\t-" "(()):" "specific arithmetic expression"
fi

#logic oprand. Note: with oprand '[[]]' rather than '[]'
#diffrence between '[]' and '[[]]':
#  -'[]': it's a command, supported by all type shells. [ $a -lt $b ] is a short hand to 'test $a -lt $b'.
#  -'[[]]': it's a keyword of bash. it's a EXPRESSION but not LISTS between '[[]]'.
if [[ a -gt 0 && b -gt 0 ]]; then
    echo -e "\t-" "[[]]:" "this keyword support a simple way for arithmetic and logic calc."
fi

echo -e "\n"

#Braces expand
echo "Brace auto-expand demo(note: with no \$ before left-brace):"

echo -e "\t-" '{1..9}:' {1..9}
echo -e "\t-" '{01..12}:' {01..12}
echo -e "\t-" '{1..9..2}:' {1..9..2}
echo -e "\t-" '{a..c}{1..9}:' {a..c}{1..9}
# another way in command substitution
echo -e "\t-" '$(seq 1 9):' $(seq 1 9)


echo -e "\n"

#process substitution: build output of one process into a pesudo-file and redirection to other process
#process substitution is supported by bash but not posix shell
echo "Process substitution demo:"
echo -e "\t-" "two temp pesudo-file redirected to sdiff cmd:"
sdiff <(ls .) <(ls .)
#Difference between pipe and process subs:
#  - Pipe forward parent cmd stdout to child cmd, when child finished, variables in child will be distroyed.
#    parent cmd exec first, then child cmd, after child finished, return to parent shell env.
#  - Process subs build output of child into a temp pesudo-file, and child cmd is exec first, when child finished,
#    the temp file is redirected to parent's shell env.
readarray -t files_list < <(ls -l .)
echo -e "\t-" "\"files_list\" in parent shell as expected:" ${#files_list[@]}

unset files_list
ls -l . | readarray -t files_list
echo -e "\t-" "\"files_list\" in child shell, can't return back to parent:" ${#files_list[@]}

echo -e "\n"

#Bash4.1+ support alloc FD dynamically in script, and then random access file as fseek/rewind worked.
echo "Random access binary file demo:"
echo -e "\t-" "step1:" "open a file with an unused FD number."
# 3< means link this FD to files read port, basically as fopen(file_name, 'r')
# 3> means link this FD to files write port, basically as fopen(file_name, 'w+')
exec 3< "/etc/passwd"
echo -e "\t-" "step2:" "read bytes with /dev/fd/FD_NUMBER."
# bytesize = 1, skip first 11 bytes, read 4 bytes, ignore statistic info output
content=$(dd if=/dev/fd/3 bs=1 skip=11 count=4 2>/dev/null)
echo -e "\t-" "step3:" "close FD number."
# 3<&- meas close file which FD 3# linked, basically as fclose(FILE* fp)
exec 3<&-
echo -e "\t\t-" "read content->" ${content}

echo "Random access ascii file demo:"
readarray -t lines < "/etc/passwd"
echo -e "\t-" "/etc/passwd:5,whole line \t->" ${lines[4]}
echo -e "\t-" "/etc/passwd:9,13~16 bytes \t->" ${lines[8]:12:4}

echo -e "\n"

# '<<<' oprand is able to input string to cmd directly, compare with '|' oprand, bash needn't spawn child shell,
# so this oprand is more efficient. this oprand is called "here string operand" as well.
echo "Here String demo:"
echo -e -n "\t-" "in pipe way ->"
echo "pipe is traditional way." | cut -d " " -f 1
echo -e -n "\t-" "in here string way ->"
cut -d " " -f 1,2 <<< "here string is more efficienct and readeable."

echo -e -n "\t-" "input dynamic here string ->"
read -ra files <<< "$(ls)"
for f in ${files[@]}; do
    echo -n -e $f "\t"
done
echo -e "\n"

# 'select' keyword is used to create interactive menu
echo "Interactive menu demo:"
menu_items=($(ls .))
menu_items=(${menu_items[@]} "quit")
PS3="Please select file to open: "
select user_selection in ${menu_items[@]}; do
    case ${user_selection} in
	( "md_test" | "shelltest.sh" )
	    echo "user select index=" ${REPLY}
	    ;;
	( "quit" )
	    echo "user select index=" ${REPLY}
	    break
    esac
done



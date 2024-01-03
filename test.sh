#!/bin/bash
assert(){
	expected="$1"
	input="$2"

	./9cc "$input" > tmp.s
	cc -o tmp tmp.s
	./tmp
	actual="$?"

	if [ "$actual" = "$expected" ]; then
		echo "$input => $actual"
	else
		echo "$input => $expected expected, but got $actual"
		exit 1
	fi
}

assert 0 0
assert 1 1
assert 42 42
assert 127 127
assert 128 128
assert 129 129
assert 255 255
assert 21 "5+20-4"
assert 118 "2+100+50-42+8"
echo OK


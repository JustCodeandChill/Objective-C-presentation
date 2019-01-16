clear

rm hello

gcc $(gnustep-config --objc-flags) -o hello hello.m $(gnustep-config --base-libs)

./hello

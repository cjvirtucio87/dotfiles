function mygo {
    MINGW_GIT='/cygdrive/c/Tools/Git/mingw64/bin';
    PATH=$MINGW_GIT:$PATH;
    printf "Running go with the Windows installation of Git.\n";
    $GOBIN/go $@;
    PATH=`echo $PATH | sed "s,$MINGW_GIT\:,,g"`;
    printf "Resetting \$PATH.";
}

alias go=mygo

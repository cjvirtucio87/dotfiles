function mygo {
    MINGW_GIT='/cygdrive/c/Tools/Git/mingw64/bin';
    PATH=$MINGW_GIT:$PATH;
    printf "Running go with the Windows installation of Git.\n";
    $GOBIN/go $@;
    PATH=`echo $PATH | sed "s,$MINGW_GIT\:,,g"`;
    printf "Resetting \$PATH.";
}

function mygovendor {
    MINGW_GIT='/cygdrive/c/Tools/Git/mingw64/bin';
    PATH=$MINGW_GIT:$PATH;
    printf "Running govendor with the Windows installation of Git.\n";
    $GOBIN/govendor $@;
    PATH=`echo $PATH | sed "s,$MINGW_GIT\:,,g"`;
    printf "Resetting \$PATH.";
}

alias go=mygo
alias govendor=mygovendor

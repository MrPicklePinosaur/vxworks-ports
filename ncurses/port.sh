#!/bin/sh

remote=""
version="ncurses-6.3"

configure() {
    cd $version
    ./configure \
        --host=x86_64-wrs-vxworks \
        --prefix=$WR_ROOT/vxsdk/sysroot/usr/root \
        cf_cv_xopen_source="no" \
        cf_cv_posix_c_source="no" \
        cf_cv_gcc_inline="no" \
        cf_cv_working_poll="no"                    
}

build() {
    cd $version
    make
}

install() {
    cd $version
    make install prefix=$WR_ROOT/vxsdk/sysroot/usr/3pp/develop/usr/include
}

if [ -z $WR_ROOT ]; then echo "WR_ROOT not set"; exit 1; fi

case $1 in
    configure) configure;;
    build) build;;
    install) install;;
    *) echo "invalid operation";;
esac

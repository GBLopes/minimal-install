#!/usr/bin/env bash

curl -LO https://download.documentfoundation.org/libreoffice/stable/24.2.4/deb/x86_64/LibreOffice_24.2.4_Linux_x86-64_deb.tar.gz && \
tar -xf LibreOffice_24.2.4_Linux_x86-64_deb.tar.gz && \
dpkg -i LibreOffice_24.2.4.2_Linux_x86-64_deb/DEBS/*.deb && \
rm -rf LibreOffice_24.2.4_Linux_x86-64_deb.tar.gz LibreOffice_24.2.4.2_Linux_x86-64_deb && \
curl -LO https://download.documentfoundation.org/libreoffice/stable/24.2.4/deb/x86_64/LibreOffice_24.2.4_Linux_x86-64_deb_langpack_pt-BR.tar.gz && \
tar -xf LibreOffice_24.2.4_Linux_x86-64_deb_langpack_pt-BR.tar.gz && \
dpkg -i LibreOffice_24.2.4.2_Linux_x86-64_deb_langpack_pt-BR/DEBS/*.deb && \
rm -rf LibreOffice_24.2.4_Linux_x86-64_deb_langpack_pt-BR.tar.gz LibreOffice_24.2.4.2_Linux_x86-64_deb_langpack_pt-BR
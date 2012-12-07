Third-party packages managed by DTO Labs
========================================

This module automates the process of publishing useful third-party packages that are not available through normal channels.

DTO Labs typically takes on this responsibility for programs and utilities that are need by our projects (e.g. by [rerun-moduled](https://github.com/rerun-modules) or solutions (e.g. Maven and JBoss AS RPMs used by our sample implementations like [toolchain-example5](https://github.com/dtolabs/toolchain-example5)).

The module currently only supports publishing Yum-based repositories of RPMs but the plan is to make the packages available in the system formats of as many platforms as possible.

Configuring
-----------

The module includes a single configuration file that determines which packages are included in the repositories. e.g:

<pre>
[anthony@centos63 third-party-packages]$ cat etc/packages 
#
# List of GitHub third-party software repositories packaged and published by DTO Labs.
#
# "owner/repository:package-name:format:distribution,...:architecture,..."
#
dtolabs/pygments-rpm:dtolabs-pygments:rpm:el5,el6:noarch
dtolabs/jq-rpm:dtolabs-jq:rpm:el5,el6:i386,x86_64
dtolabs/discount-rpm:dtolabs-discount:rpm:el5,el6:i386,x86_64
dtolabs/xmlstarlet-rpm:dtolabs-xmlstarlet:rpm:el5,el6:i386,x86_64
dtolabs/jboss-as-rpm:dtolabs-jboss-as:rpm:el5,el6:noarch
dtolabs/apache-maven-rpm:dtolabs-apache-maven:rpm:el5,el6:noarch
</pre>

The file lists the GitHub repositories of the Rerun package build modules used to build and upload each third-party pacakge. Additional fields supply the package format produced the build module (only rpm packages are currently supported), the list of OS distributions supported and the set of target architectures.

Usage
-----



#!/bin/bash
dir="0"
if [ -d $1 ] ; then
	ls -1 $1/*.xml
        dir="1"
elif [ -f $1 ]; then
        ls -all $1
else
	exit 1
fi

function blog_import()
{
	ruby -rubygems -e 'require "jekyll-import";
                JekyllImport::Importers::Blogger.run({
                "source"                => "'$feed'",
                "no-blogger-info"       => false, # not to leave blogger-URL info (id and old URL) in the front matter
                "replace-internal-link" => false, # replace internal links using the post_url liquid tag.
        })'

}

if [ "$dir" -eq "1" ] ; then
	for feed in $(ls -1 blogger/*.xml)
	do
		blog_import
	done
else
	feed=$1
	blog_import
fi

exit 0

mv _drafts/*.html _posts/

ruby _scripts/blogger_convert.rb

if [ -d _posts ] ; then
	rm -rf _posts/*.html
fi

exit 0

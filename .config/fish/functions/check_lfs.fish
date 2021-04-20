function check_lfs
for i in (ls -d */);
echo $i;
cd $i;
git lfs ls-files | wc;
cd ..;
end
end

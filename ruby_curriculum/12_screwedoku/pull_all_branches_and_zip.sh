./git_setup.sh

rm -f screwedoku.zip
cd ..

zip -r screwedoku.zip screwedoku;
mv screwedoku.zip screwedoku/;


echo ""
echo "Your zip file lives in screwedoku.zip"

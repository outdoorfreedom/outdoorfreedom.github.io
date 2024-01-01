counter=1

new_name="bischofalp"
dir_name="snowhikes"


cd photos/$new_name

for file in *; do
    # Check if it's a file (not a directory)
    if [ -f "$file" ]; then
	if [[ "$file" != *"202"* ]]; then
            break
	fi
        # Create the new filename
        new_file_name="$new_name$counter.jpg"

        # Rename the file
        mv "$file" "$new_file_name"

        # Increment the counter for the next file
        ((counter++))
    fi
done

cd -

git add photos/$new_name
git add photos/$new_name/*


#Creation of HTML
cd $dir_name
upper_new_name="${new_name^}"

cp amden.html $new_name.html
sed -i "s/amden/$new_name/g" $new_name.html
sed -i "s/Amden/$upper_new_name/g" $new_name.html

git add $new_name.html

cd -

#Generate index input
echo "
    <div class=\"tile-topup tile-blue\">
      <a href=\"https://outdoorfreedom.github.io/snowhikes/${new_name}.html\"><img src=\"photos/${new_name}/${new_name}0.jpg\" width=\"450\" height=\"250\" /></a>
      <h4><a href=\"https://outdoorfreedom.github.io/snowhikes/${new_name}.html\">${new_name} snowshoe hike</a></h4>
    </div>
"


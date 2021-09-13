#! /bin/bash

# Declare our repos in an array
declare -a arr=(
    breakable-code-blocks custom-error-page disney-villains-api duck-hunt fantasy-scoring
    for-the-empire great-novels-api great-novels-ui greetings-ui hazy-calculator
    head-of-the-class hello-you mlb-database movie-api nfl-api order-book perfect-linup
    password-validator price-is-right react-calculator string-section tdd-strict-equal
    tv-synopsis web-calculator candy-maker-ui candy-maker-api
)

# Create our base URL
BASE_URL="https://github.com/stackeducation"
BASE_DIR=$(pwd)

# Make our folder to hold all the folders
rm -rf repos
mkdir repos

# Loop
for REPO_NAME in "${arr[@]}"; do
    # Clone the repo
    REPO_URL="$BASE_URL/$REPO_NAME"
    git clone $REPO_URL
    # Move into repo, and remove remote origin to remove extra branches
    cd $REPO_NAME
    git remote rm origin
    # Move back to main folder and zip up repo
    cd $BASE_DIR
    zip -r "$REPO_NAME.zip" $REPO_NAME
    # Move zipped folder into repo folder, then delete the repo folder
    mv "$REPO_NAME.zip" "repos/$REPO_NAME.zip"
    rm -rf $REPO_NAME
done

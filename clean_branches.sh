# Git branches cleanup utility
# @author dashk
# @date 2016.06.22

# Step 1: Navigate to master branch
git checkout master

# Step 2: Get a list of branches that are NOT master
branches=( $(git branch | grep -v 'master' | grep -v '\*' | awk '{print $1}') )

# Step 3: Determine if there are any branches we need to process
branchCount=${#branches[@]}

echo "Total # of non-master branches: ${branchCount}"

if [ $branchCount = 0 ]
then
        echo "No branches to process"
else
        # Step 4: For each branch, prompt if it should be deleted/kept.
        for branch in "${branches[@]}"
        do
                :
                echo "Checking branch $branch"
                read -n1 -p "Do you want to delete this? (y/N) " userInput
                echo "\r\n"

                # Step 4.1 Delete branch per user request
                if [[ $userInput == "Y" || $userInput == "y" ]]; then
                        git branch -D $branch
                        echo "Branch $branch deleted\r\n"
                fi
        done
fi

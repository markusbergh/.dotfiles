#!/bin/bash

# Colors
cNone='\033[00m'
cRed='\033[01;31m'
cGreen='\033[01;32m'
cYellow='\033[01;33m'
cPurple='\033[01;35m'
cCyan='\033[01;36m'
cWhite='\033[01;37m'
cBlue='\033[01;94m'
cBold='\033[1m'
cUnderline='\033[4m'

# Ask whether we are running a workspace or project

title="
-------- xcodebuild helper --------
"

echo "$title"


## Project type (project|workspace)

echo -e "${cYellow}Do you want to build a project or a workspace?${cNone} "
project_options=("Workspace" "Project")
PS3="Pick an option: "

select project_option in "${project_options[@]}"
do
  case $project_option in
    "Workspace")
      project_type="-workspace"
      break
      ;;
    "Project")
      project_type="-project"
      break
      ;;
  esac
done

case $project_type in
  "-workspace")
    echo -e "${cYellow}What is the name of the WORKSPACE you want to run?${cNone} "
    ;;
  "-project")
    echo -e "${cYellow}What is the name of the PROJECT you want to run?${cNone} "
    ;;
esac

unset project_name
while [ -z ${project_name} ]; do
  read project_name
done

## Project name

case $project_type in
  "-workspace")
    project_command="$project_name.xcworkspace"
    ;;
  "-project")
    project_command="$project_name.xcodeproj"
    ;;
esac

## Scheme

echo -e "${cYellow}What is the name of the scheme you want to run?${cNone} "
unset scheme_name
while [ -z ${scheme_name} ]; do
  read scheme_name
done

## Action

echo -e "${cYellow}What do you want to do?${cNone} "
run_options=("Run tests" "Just build")

select run_option in "${run_options[@]}"
do
  case $run_option in
    "Run tests")
      run_as="test"
      break
      ;;
    "Just build")
      run_as="build"
      break
      ;;
  esac
done

## If running tests, should we run all or a single one?

if [ $run_as == "test" ]
then
  echo -e "${cYellow}Do you want to run all tests or a single one?${cNone} "
  run_all_or_single_options=("Run all tests" "Run single test")

  select run_all_or_single in "${run_all_or_single_options[@]}"
  do
    case $run_all_or_single in
      "Run all tests")
        break
        ;;
      "Run single test")
        run_single="true"
        break
        ;;
    esac
  done

  if [ $run_single == "true" ]
  then
    echo -e "${cYellow}What is the name of the single test you want to run?${cNone} "
    unset single_test_name
    while [ -z ${single_test_name} ]; do
      read single_test_name
    done
  fi
fi

main_command="xcodebuild $project_type $project_command -scheme $scheme_name -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 12 Pro,OS=14.5'"

if [ $run_as="test" ] && [ $run_single="true" ]
then
  echo -e "${cBlue}
  ~~~~~ Running ~~~~~

  ${cGreen}xcodebuild
    $project_type $project_command
    -scheme $scheme_name
    -sdk iphonesimulator
    -destination 'platform=iOS Simulator,name=iPhone 12 Pro,OS=14.5'
    -only-testing $single_test_name
    test

  ${cYellow}Using: xcpretty (for output)${cNone}
  "

  bash -c "$main_command -only-testing $single_test_name test | xcpretty"

elif [ $run_as="test" ]
then
  echo -e "${cBlue}
  ~~~~~ Running ~~~~~

  ${cGreen}xcodebuild
    $project_type $project_command
    -scheme $scheme_name
    -sdk iphonesimulator
    -destination 'platform=iOS Simulator,name=iPhone 12 Pro,OS=14.5'
    test

  ${cYellow}Using: xcpretty (for output)${cNone}
  "

  bash -c "$main_command test | xcpretty"

else
  echo -e "${cBlue}
  ~~~~~ Running ~~~~~

  ${cGreen}xcodebuild
    $project_type $project_command
    -scheme $scheme_name
    -sdk iphonesimulator
    -destination 'platform=iOS Simulator,name=iPhone 12 Pro,OS=14.5'
    build

  ${cYellow}Using: xcpretty (for output)${cNone}
  "

  bash -c "$main_command build | xcpretty"

fi

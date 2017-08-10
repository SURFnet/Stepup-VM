#!/bin/sh

# Deploy all components of a release. Use "--help" for help

# Default release to deploy
RELEASE=11

# Add new releases here

COMPONENTS_RELEASE_11=(
"Stepup-Gateway-2.6.0-20170801071509Z-57618638b03838a5ed21f7b5376342a1797030d7.tar.bz2" # new
"Stepup-Middleware-2.6.0-20170801073238Z-15d255e9c64bdaf8fcce2f1806e9c4ab893ee24c.tar.bz2" # new
"Stepup-SelfService-2.7.0-20170801141012Z-d06bbb5ee3807dbd8e51338855e201ce41023c50.tar.bz2" # new
"Stepup-RA-2.7.0-20170801141958Z-1ba3e4d8b9d9df97d904842854da41c0ce498cb4.tar.bz2" # new
"Stepup-tiqr-v1.1.5-20170424220742Z-d0aab72dcb5f0e37f49332039b27e6200bbe8318.tar.bz2"
"oath-service-php-1.0.1-20150723081351Z-56c990e62b4ba64ac755ca99093c9e8fce3e8fe9.tar.bz2"
)

COMPONENTS_RELEASE_10=(
"Stepup-Gateway-2.5.0-20170310090101Z-525d8b4a37d40dd1541aa9aa22f81b2535715426.tar.bz2" # new
"Stepup-Middleware-2.5.0-20170310104904Z-1c564128270dff2eeb4a1565afc983a027d9a787.tar.bz2" # new
"Stepup-SelfService-2.6.2-20170517121255Z-e4031c52eee042ad52085dbb8c0300a2eca400a2.tar.bz2" # new
"Stepup-RA-2.6.1-20170327113418Z-43c0eeccfd5fc91cfe31fb3c9b71ceb0789f2201.tar.bz2" # new
"Stepup-tiqr-v1.1.5-20170424220742Z-d0aab72dcb5f0e37f49332039b27e6200bbe8318.tar.bz2" # new
"oath-service-php-1.0.1-20150723081351Z-56c990e62b4ba64ac755ca99093c9e8fce3e8fe9.tar.bz2"
)

COMPONENTS_RELEASE_9=(
"Stepup-Gateway-2.4.2-20170227124204Z-8f91163df68e1fc53665a23d0aad23db5c4f165d.tar.bz2" # new
"Stepup-Middleware-2.4.0-20170221153150Z-2d4a416e4a3c9832a9914f8d8aaf12a3c54d83ef.tar.bz2" # new
"Stepup-SelfService-2.5.0-20170221154613Z-fe5c1ff607652f47b6c297bc3c8622a787135846.tar.bz2" # new
"Stepup-RA-2.4.0-20161130155145Z-bafb84b3ee966990f5b2115d56b04988e7f0cc6b.tar.bz2"
"Stepup-tiqr-1.1.2-20160411073201Z-4e2581d65b4c589031df524b30627474eca9fa50.tar.bz2"
"oath-service-php-1.0.1-20150723081351Z-56c990e62b4ba64ac755ca99093c9e8fce3e8fe9.tar.bz2"
)

COMPONENTS_RELEASE_8=(
"Stepup-Gateway-2.1.0-20160808153413Z-99293417f90edc05415e7fa7b2873f563de7a8cd.tar.bz2"
"Stepup-Middleware-2.3.1-20161202111856Z-842810702ab76ce36b9fef8c00ba56f91f4bd935.tar.bz2" # new
"Stepup-SelfService-2.3.0-20161118105735Z-eebc000542020fa8518edf016221e9b973874bd2.tar.bz2" # new
"Stepup-RA-2.4.0-20161130155145Z-bafb84b3ee966990f5b2115d56b04988e7f0cc6b.tar.bz2" # new
"Stepup-tiqr-1.1.2-20160411073201Z-4e2581d65b4c589031df524b30627474eca9fa50.tar.bz2"
"oath-service-php-1.0.1-20150723081351Z-56c990e62b4ba64ac755ca99093c9e8fce3e8fe9.tar.bz2"
)

COMPONENTS_RELEASE_7=(
"Stepup-Gateway-2.1.0-20160808153413Z-99293417f90edc05415e7fa7b2873f563de7a8cd.tar.bz2" # new
"Stepup-Middleware-2.0.2-20160810101855Z-d8d88d778ea30379b606cbca58d9634ff0541b42.tar.bz2" # new
"Stepup-SelfService-2.1.0-20160812150713Z-0fe329a64b14e0f15cb956cd0c043e4b1595d8d7.tar.bz2" # new
"Stepup-RA-2.1.2-20160815123919Z-8939c8b11b1de79c3018ce7c7b4fe9d2ac62462b.tar.bz2" # new
"Stepup-tiqr-1.1.2-20160411073201Z-4e2581d65b4c589031df524b30627474eca9fa50.tar.bz2" # new
"oath-service-php-1.0.1-20150723081351Z-56c990e62b4ba64ac755ca99093c9e8fce3e8fe9.tar.bz2"
)

SINGLE_COMPONENT=""

while [[ $# > 0 ]]
do
option="$1"
shift
    case $option in
        -h|--help)
        echo "Usage: $0 [--release <release number>] [--component <component name>]"
        echo "Deploys all the components of the specified release. Components are downloaded from github when required."
        echo "By default all components from 'Release ${RELEASE}' are deployed."
        echo ""
        echo "--release <number> : Deploy the specified release"
        echo "--component <name> : Deploy only the specifed component"
        echo ""
        exit 0
        ;;
        -r|--release)
        RELEASE="$1"
        if [ -z "$1" ]; then
            error_exit "--release option requires argument"
        fi
        shift
        ;;
        -c|--component)
        SINGLE_COMPONENT="$1"
        if [ -z "$1" ]; then
            error_exit "--component option requires argument"
        fi
        shift
        ;;
        *)
        error_exit "Unknown option: '${option}'"
        ;;
    esac
done

#COMPONENTS=( "${COMPONENTS_RELEASE_7[@]}" )

eval COMPONENTS=( "\${COMPONENTS_RELEASE_${RELEASE}[@]}" )
if [ -z "$COMPONENTS" ]; then
    echo "Release ${RELEASE} is not defined"
    exit 1
fi

echo "Deploying component(s) of Release ${RELEASE}"

if [ ! -d "./tarballs" ]; then
    echo "Creating directory './tarballs' because is does not exist"
    mkdir "./tarballs"
fi

for comp in "${COMPONENTS[@]}"; do
    pattern='^(Stepup-Gateway|Stepup-Middleware|Stepup-SelfService|Stepup-RA|Stepup-tiqr|oath-service-php)-(.*)\.tar\.bz2$'
    [[ $comp =~ $pattern ]]
    repo_name=${BASH_REMATCH[1]}
    release_name=${BASH_REMATCH[2]}
    if [ ! -z "${SINGLE_COMPONENT}" -a "${repo_name}" != "${SINGLE_COMPONENT}" ]; then
        continue
    fi

    if [ ! -f "./tarballs/$comp" ]; then
        echo "File './tarballs/${comp}' not found"
        if [ "${repo_name}" == "oath-service-php" ]; then
            download_url=https://github.com/SURFnet/${repo_name}/releases/download/${release_name}/${comp}
        else
            download_url=https://github.com/OpenConext/${repo_name}/releases/download/${release_name}/${comp}
        fi
        echo "Downloading ${download_url}"
        curl -L -o "./tarballs/${comp}" "${download_url}"
        if [ $? -ne 0 ]; then
            echo "Download failed"
            exit 1
        fi
    fi
    echo "Deploying './tarballs/${comp}'"
    ./deploy/scripts/deploy.sh ./tarballs/${comp} -i ./environment/inventory -l 'app*'
    if [ $? -ne 0 ]; then
        echo "Deploy failed"
        exit 1
    fi
done

echo ""
echo "==========================================================="
echo "To run the bootstrap scripts on the application server use:"
echo "./bootstrap-app.sh"
echo "==========================================================="
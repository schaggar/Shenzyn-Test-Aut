import glob
import os
from zipfile import ZipFile
from shutil import copy,rmtree

report = glob.glob(r'C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn\Results\report-*.html')
log = glob.glob(r'C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn\Results\log-*.html')
output = glob.glob(r'C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn\Results\output-*.xml')

#os.mkdir(r'D:\robotframework\Shenzyn-Test-Aut\development\shenzyn\temp')

filenames = []
for x in report,log,output:
    filenames.append(max(x,key=os.path.getctime))

for filecopy in filenames:
    copy(filecopy,r'C:\temp')

def get_all_file_paths(directory):
    # initializing empty file paths list
    file_paths = []

    # crawling through directory and subdirectories
    for root, directories, files in os.walk(directory):
        for filename in files:
            # join the two strings in order to form the full filepath.
            filepath = os.path.join(root, filename)
            file_paths.append(filepath)

            # returning all file paths
    return file_paths

def main():
    # path to folder which needs to be zipped
    directory = r'C:\temp'

    # calling function to get all file paths in the directory
    file_paths = get_all_file_paths(directory)

    # printing the list of all files to be zipped
    print('Following files will be zipped:')
    for file_name in file_paths:
        print(file_name)

        # writing files to a zipfile
    with ZipFile(r'C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn\ZippedResults\jobseeker.zip', 'w') as zip:
        # writing each file one by one
        for file in file_paths:
            zip.write(file)

    print('All files zipped successfully!')

    for x in file_paths:
        os.remove(x)
    print('Jobseeker Temporary Files Removed Successfully!')

if __name__ == "__main__":
    main()

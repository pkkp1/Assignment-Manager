//fileuploader has input file control containing file to be saved
//folder path has the path of the folder the file needs to be saved at
function uploadFile(fileuploader, folderpath) {

    var fPath = fileuploader;
    var fData = new FormData();
    var file = fPath.files[0];
    var dte = new Date();
    var parts = file.name.split('.');

    //We add current timestamp to the file so that same file names
    //do not clash
    var newName = parts[0] + '_' + dte.getTime() + '.' + parts[parts.length - 1];
    var newName = newName.replace(' ', '_');
    //The ? character is being used to seperate folder path from file name
    //The reason we use ? is because you cannot save a file with
    //? in it's name therefore it is safe to use
    fData.append('file', file, folderpath + "?" + newName);
    $.ajax({
        url: "../Handler.ashx",
        type: 'POST',
        data: fData,
        cache: false,
        contentType: false,
        processData: false,

        // Testing/Debugging code

        //success: function (file) {
            //alert(file + " success")
        //},
        //error: function (err) { alert(err + "An Unexpected Error Occured"); },
        //xhr: function () {
        //    var fileXhr = $.ajaxSettings.xhr();
        //    if (fileXhr.upload) {
        //        alert("File is being uploaded");
        //    }
        //    return fileXhr;
        //}
    });
    return newName;
}
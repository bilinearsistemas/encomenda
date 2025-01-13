const alert = {
    success(title, msg) {
        swal({
            title: title,
            html: msg,
            type: "success",
            confirmButtonClass: "btn btn-success"
        });
    },
    error(title, msg) {
        swal({
            title: title,
            html: msg,
            type: "error",
            confirmButtonClass: "btn btn-danger"
        });
    }
}
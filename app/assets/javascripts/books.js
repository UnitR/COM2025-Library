// Ajax call to show book details in a modal
function showBookDetails(jBookBtn) {
    var bookId = $(jBookBtn).data("id");
    $.ajax({
        url: "/books/" + bookId,
        type: "GET",
        success: function(bookData) {
            $(".modal-body").html(bookData.html);
            $("#bookInfoModal").modal("show");
        },
        error: function() {
            alert("Could not find any information about the book.");
        }
    });
}

// Ajax call to delete a book
function deleteBook(jBookBtn) {
    var oBookBtn = $(jBookBtn);
    var bookId = oBookBtn.data("id");
    if(confirm("Are you sure you want to delete this book?")) {
        $.ajax({
            url: "/books/" + bookId,
            type: "DELETE",
            success: updateHeader(oBookBtn),
            error: function() {
                alert("An error occured while deleting the book. Please try again.");
            }
        });
    }
}

// Update header text for deleted elements
function updateHeader(oBookBtn) {
    var oContainer = oBookBtn.parents(".elContainer");
    var oHeader = oContainer.children("div:first-child").children(".elHeader");
    oHeader.append("<span><i>&nbsp;(Deleted)</i></span");
    oContainer.css("opacity", "0.5")
    oBookBtn.parents(".elButtons").hide();
}
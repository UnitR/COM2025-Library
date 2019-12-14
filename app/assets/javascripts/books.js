// Ajax call to show book details in a modal
function showBookDetails(jBookBtn) {
    var bookId = $(jBookBtn).data("id");
    $.ajax({
        url: "/books/" + bookId,
        type: "GET",
        success: function(data) {
            setDetails(data);
        },
        error: function() {
            alert("Could not find any information about the book.");
        }
    });
}

// Ajax call to edit a book
function editBook(jBookBtn) {
    var bookId = $(jBookBtn).data("id");
    $.ajax({
        url: "/books/" + bookId + "/edit",
        type: "GET",
        success: function(data) {
            setDetails(data);
        },
        error: function() {
            alert("Could not find requested for editing book.");
        }
    });
}

// Ajax call to edit a book
function updateBook(iBookId) {
    $.ajax({
        url: "/books/" + iBookId,
        type: "POST",
        data: $("#formBook").serialize(),
        success: bookUpdated(),
        error: function() {
            alert("Book edit was unsuccessful.");
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

// Update book details
function setDetails(bookData) {
    $(".modal-body").html(bookData);
    $("#bookInfoModal").modal("show");
}

// Indicate successful book update
function bookUpdated() {
    alert('Successfully updated book.');
    $("#bookInfoModal").modal("hide");
}

// Update header text for deleted elements
function updateHeader(oBookBtn) {
    var oContainer = oBookBtn.parents(".elContainer");
    var oHeader = oContainer.children("div:first-child").children(".elHeader");
    oHeader.append("<span><i>&nbsp;(Deleted)</i></span");
    oContainer.css("opacity", "0.5")
    oBookBtn.parents(".elButtons").hide();
}
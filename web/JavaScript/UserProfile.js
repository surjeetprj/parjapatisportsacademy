              // toggle content by clicking button 
            $(document).ready(function () {
            editStatus = false;
                    $('#edit-profile-button').click(function () {
            if (editStatus === false) {
            $("#profile-detail").hide();
                    $("#profile-edit").show();
                    $(this).text("Back");
                    editStatus = true;
            }
            else {
            $("#profile-detail").show();
                    $("#profile-edit").hide();
                    $(this).text("Edit");
                    editStatus = false;
            }

            });
                // toggle personal details and address details by clicking button
                     viewStatus = false;
                    $('#view-details-btn').click(function () {
            if (viewStatus === false) {
            $("#personal-details").hide();
                    $("#address-details").show();
                    $(this).text("Personal details");
                    viewStatus = true;
            }
            else {
            $("#personal-details").show();
                    $("#address-details").hide();
                    $(this).text("View Address");
                    viewStatus = false;
            }

            });
            });           



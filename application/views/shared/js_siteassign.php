$(function(){
	
    $(document).on('click', '#assignSite', function () {
        var siteId = $(this).attr('data-siteid');
        var siteName = $('#site_' + siteId).find('.top b').text();
        $('#siteNameTabLbl').text(siteName);
        $('#siteName').val(siteName);
        $('#siteID').val(siteId);
        return false;
    });

    $('#assigned_user').autocomplete({
        minLength: 3,
        source: "users/autocomplete",
        select: function( event, ui ) {
            event.preventDefault();
            $('#assigned_user').val(ui.item.label);
            $('#assigned_user_id').val(ui.item.value);
        },
        focus: function( event, ui ) {
            event.preventDefault();
            $('#assigned_user').val(ui.item.label);
        }
    });

    //user details
    $('#siteAssignSubmit').click(function(){

            //all fields filled in?

            allGood = 1

            if( $('#site_assign_details input#siteID').val() == '' ) {
                $('#site_assign_details input#siteID').closest('.form-group').addClass('has-error');
                allGood = 0;
            } else {
                $('#site_assign_details input#siteID').closest('.form-group').removeClass('has-error');
                allGood = 1;
            }

            if( $('#site_assign_details input#assigned_user').val() == '' ) {
                $('#site_assign_details input#assigned_user').closest('.form-group').addClass('has-error');
                allGood = 0;
            } else {
                $('#site_assign_details input#assigned_user').closest('.form-group').removeClass('has-error');
                allGood = 1;
            }


        if( allGood == 1 ) {

            theButton = $(this);

            //disable button
            $(this).addClass('disabled');

            //show loader
            $('#site_assign_details .loader').fadeIn(500);

            //remove alerts
            $('#site_assign_details .alerts > *').remove();
            
            $.ajax({
                url: "<?php echo site_url('sites/assign')?>",
                type: 'post',
                dataType: 'json',
                data: $('#site_assign_details').serialize()
            }).done(function(ret){
                //enable button
                theButton.removeClass('disabled');

                //hide loader
                $('#site_assign_details .loader').hide();

                $('#site_assign_details .alerts').append( $(ret.responseHTML) );

                if( ret.responseCode == 1 ) {
                    //success
                    var siteId = $('#siteID').val();
                    var userName = $('#assigned_user').val();
                    $('#site_' + siteId).find('.siteDetails p:first-child b:first-child').text(userName);
                    
                    setTimeout(function(){ $('#site_assign_details .alerts > *').fadeOut(500, function(){ $(this).remove(); }) }, 3000);
                }

            });

        }

    });
    
});
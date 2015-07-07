<div class="modal fade accountModal" id="siteassignModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"><?php echo $this->lang->line('modal_close') ?></span></button>
                <h4 class="modal-title" id="myModalLabel"> <?php echo $this->lang->line('assign_site') ?></h4>
            </div>

            <div class="modal-body padding-top-40">

                <ul class="nav nav-tabs nav-append-content">
                    <li class="active"><a id="siteNameTabLbl" href="#siteNameTab"><span class="fui-user"></span> <?php echo $this->lang->line('account_tab_account') ?></a></li>
                </ul> <!-- /tabs -->

                <div class="tab-content">

                    <?php
                    $user = $this->ion_auth->user()->row();
                    ?>

                    <div class="tab-pane active" id="siteNameTab">

                        <form class="form-horizontal" role="form" id="site_assign_details" >

                            <div class="loader" style="display: none;">
                                <img src="<?php echo base_url(); ?>images/loading.gif" alt="Loading...">
                            </div>

                            <div class="alerts"></div>

                            <input type="hidden" name="userID" value="<?php echo $user->id; ?>">
                            <input type="hidden" name="siteID" id="siteID" value="">
                            <input type="hidden" name="siteName" id="siteName" value="">
                            <input type="hidden" name="assigned_user_id" id="assigned_user_id" value="">

                            <div class="form-group">
                                <label for="assigned_user" class="col-md-3 control-label"><?php echo $this->lang->line('search_user') ?></label>
                                <div class="col-md-9 input-group">
                                    <input type="text" class="form-control" id="assigned_user" name="assigned_user" placeholder="<?php echo $this->lang->line('users_emailfield_placeholder') ?>" value="">
                                    <span class="input-group-btn">
                                    <button type="button" class="btn">
                                        <span class="fui-search"></span>
                                    </button>
                                </span>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-offset-3 col-md-9">
                                    <button type="button" class="btn btn-primary btn-embossed btn-block" id="siteAssignSubmit"><span class="fui-check"></span> <?php echo $this->lang->line('assign_site') ?></button>
                                </div>
                            </div>

                        </form>

                    </div>

                </div> <!-- /tab-content -->

            </div><!-- /.modal-body -->

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fui-cross"></span> <?php echo $this->lang->line('modal_cancelclose') ?></button>
            </div>

        </div><!-- /.modal-content -->

    </div><!-- /.modal-dialog -->

</div><!-- /.modal -->
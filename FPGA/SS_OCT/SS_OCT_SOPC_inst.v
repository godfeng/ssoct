  //Example instantiation for system 'SS_OCT_SOPC'
  SS_OCT_SOPC SS_OCT_SOPC_inst
    (
      .aux_scan_clk_from_the_ddr2                   (aux_scan_clk_from_the_ddr2),
      .aux_scan_clk_reset_n_from_the_ddr2           (aux_scan_clk_reset_n_from_the_ddr2),
      .clk_50                                       (clk_50),
      .control_done_from_the_master_read            (control_done_from_the_master_read),
      .control_done_from_the_master_write           (control_done_from_the_master_write),
      .control_early_done_from_the_master_read      (control_early_done_from_the_master_read),
      .control_fixed_location_to_the_master_read    (control_fixed_location_to_the_master_read),
      .control_fixed_location_to_the_master_write   (control_fixed_location_to_the_master_write),
      .control_go_to_the_master_read                (control_go_to_the_master_read),
      .control_go_to_the_master_write               (control_go_to_the_master_write),
      .control_read_base_to_the_master_read         (control_read_base_to_the_master_read),
      .control_read_length_to_the_master_read       (control_read_length_to_the_master_read),
      .control_write_base_to_the_master_write       (control_write_base_to_the_master_write),
      .control_write_length_to_the_master_write     (control_write_length_to_the_master_write),
      .ddr2_aux_full_rate_clk_out                   (ddr2_aux_full_rate_clk_out),
      .ddr2_aux_half_rate_clk_out                   (ddr2_aux_half_rate_clk_out),
      .ddr2_phy_clk_out                             (ddr2_phy_clk_out),
      .dll_reference_clk_from_the_ddr2              (dll_reference_clk_from_the_ddr2),
      .dqs_delay_ctrl_export_from_the_ddr2          (dqs_delay_ctrl_export_from_the_ddr2),
      .flash_tristate_bridge_address                (flash_tristate_bridge_address),
      .flash_tristate_bridge_data                   (flash_tristate_bridge_data),
      .flash_tristate_bridge_readn                  (flash_tristate_bridge_readn),
      .flash_tristate_bridge_writen                 (flash_tristate_bridge_writen),
      .global_reset_n_to_the_ddr2                   (global_reset_n_to_the_ddr2),
      .in_port_to_the_pb_pio                        (in_port_to_the_pb_pio),
      .in_port_to_the_sw_pio                        (in_port_to_the_sw_pio),
      .in_port_to_the_vol_recording_done_pio        (in_port_to_the_vol_recording_done_pio),
      .led_an_from_the_tse_mac                      (led_an_from_the_tse_mac),
      .led_char_err_from_the_tse_mac                (led_char_err_from_the_tse_mac),
      .led_col_from_the_tse_mac                     (led_col_from_the_tse_mac),
      .led_crs_from_the_tse_mac                     (led_crs_from_the_tse_mac),
      .led_disp_err_from_the_tse_mac                (led_disp_err_from_the_tse_mac),
      .led_link_from_the_tse_mac                    (led_link_from_the_tse_mac),
      .local_init_done_from_the_ddr2                (local_init_done_from_the_ddr2),
      .local_refresh_ack_from_the_ddr2              (local_refresh_ack_from_the_ddr2),
      .local_wdata_req_from_the_ddr2                (local_wdata_req_from_the_ddr2),
      .mdc_from_the_tse_mac                         (mdc_from_the_tse_mac),
      .mdio_in_to_the_tse_mac                       (mdio_in_to_the_tse_mac),
      .mdio_oen_from_the_tse_mac                    (mdio_oen_from_the_tse_mac),
      .mdio_out_from_the_tse_mac                    (mdio_out_from_the_tse_mac),
      .mem_addr_from_the_ddr2                       (mem_addr_from_the_ddr2),
      .mem_ba_from_the_ddr2                         (mem_ba_from_the_ddr2),
      .mem_cas_n_from_the_ddr2                      (mem_cas_n_from_the_ddr2),
      .mem_cke_from_the_ddr2                        (mem_cke_from_the_ddr2),
      .mem_clk_n_to_and_from_the_ddr2               (mem_clk_n_to_and_from_the_ddr2),
      .mem_clk_to_and_from_the_ddr2                 (mem_clk_to_and_from_the_ddr2),
      .mem_cs_n_from_the_ddr2                       (mem_cs_n_from_the_ddr2),
      .mem_dm_from_the_ddr2                         (mem_dm_from_the_ddr2),
      .mem_dq_to_and_from_the_ddr2                  (mem_dq_to_and_from_the_ddr2),
      .mem_dqs_to_and_from_the_ddr2                 (mem_dqs_to_and_from_the_ddr2),
      .mem_dqsn_to_and_from_the_ddr2                (mem_dqsn_to_and_from_the_ddr2),
      .mem_odt_from_the_ddr2                        (mem_odt_from_the_ddr2),
      .mem_ras_n_from_the_ddr2                      (mem_ras_n_from_the_ddr2),
      .mem_we_n_from_the_ddr2                       (mem_we_n_from_the_ddr2),
      .oct_ctl_rs_value_to_the_ddr2                 (oct_ctl_rs_value_to_the_ddr2),
      .oct_ctl_rt_value_to_the_ddr2                 (oct_ctl_rt_value_to_the_ddr2),
      .out_port_from_the_led_pio                    (out_port_from_the_led_pio),
      .out_port_from_the_seven_seg_pio              (out_port_from_the_seven_seg_pio),
      .out_port_from_the_vol_transfer_done_pio      (out_port_from_the_vol_transfer_done_pio),
      .pll_sys_clk                                  (pll_sys_clk),
      .ref_clk_to_the_tse_mac                       (ref_clk_to_the_tse_mac),
      .reset_n                                      (reset_n),
      .reset_phy_clk_n_from_the_ddr2                (reset_phy_clk_n_from_the_ddr2),
      .rxp_to_the_tse_mac                           (rxp_to_the_tse_mac),
      .select_n_to_the_ext_flash                    (select_n_to_the_ext_flash),
      .txp_from_the_tse_mac                         (txp_from_the_tse_mac),
      .user_buffer_full_from_the_master_write       (user_buffer_full_from_the_master_write),
      .user_buffer_input_data_to_the_master_write   (user_buffer_input_data_to_the_master_write),
      .user_buffer_output_data_from_the_master_read (user_buffer_output_data_from_the_master_read),
      .user_data_available_from_the_master_read     (user_data_available_from_the_master_read),
      .user_read_buffer_to_the_master_read          (user_read_buffer_to_the_master_read),
      .user_write_buffer_to_the_master_write        (user_write_buffer_to_the_master_write)
    );


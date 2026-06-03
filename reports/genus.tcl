read_libs /Data/cad/cadence/installs/FOUNDRY/digital/90nm/lib/typical.lib

read_hdl alu_control.v
read_hdl alu.v
read_hdl control_unit.v
read_hdl data_memory.v
read_hdl immediate_extender.v
read_hdl instr_decoder.v
read_hdl mux_for_alu.v
read_hdl mux_for_pc.v
read_hdl mux_for_result.v
read_hdl pcadder.v
read_hdl pctarget.v
read_hdl program_counter.v
read_hdl register_file.v
read_hdl top_module.v
elaborate top_module

report_hierarchy > class.rpt

read_sdc two.sdc

syn_generic

syn_map

syn_opt

report_area > area.rpt

report_timing > timing.rpt

report_power > power.rpt

report_qor > qor.rpt

write_hdl > two_syn.v

#!/usr/bin/env ruby


def do_help
  puts "Usage: psca [command] <parameters>"
  puts " "
  puts "Commands:"
  puts "        "
  puts "    help           display this help message"
  puts "    options        configure general options"
end

def do_is_runtime_user_nix
  result = ENV['USER'] == PS_RUNTIME_USER ? true : false
end

def do_is_runtime_user_win
  result = ENV['USERNAME'] == PS_RUNTIME_USER ? true : false
end

def env(var)
  result = "#{OS_CONST}" == "linux" ? "${#{var}}" : "$env:#{var}"
end

def os
  @os ||= (
      host_os = RbConfig::CONFIG['host_os']
          case host_os
          when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
              :windows
          when /darwin|mac os/
              :macosx
          when /linux/
              :linux
          when /solaris|bsd/
              :unix
          else
              raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
          end
   )
end

# Add functions to perform each CA action here
# ENVIMP = Import Environment
# ENVCREATE = Create Environment
# ENVUPDATE = Update Environment
# EMFVAL = Validate EMF Settings
# OPTIONS = Set General Options
# UPLDTGT = Upload Target database to PUM Source
# CPAPPLY = Apply Previously Created (non-PRP) Change Package
# PRPAPPLY = Apply PRP
# PTPAPPLY = Apply a patch to your Current PeopleTools Release
# PTUAPPLY = Upgrade to a New Release of PeopleTools
# UPGAPPLY = Apply Application Upgrade
# DLTAPPLY = Apply Tools Delta Package
# TDPAPPLY = Apply Translation Delta Package
# RFUAPPLY = Apply Required for Upgrade Package
# CPCREATE = Create Change Package
# EXPCFG = Export configuration
# IMPCFG = Import configuration
# IMPCUSTDATA = Import customer data from the data file to the new PUM source
# EXPCUSTDATA= Export customer data from existing PUM source and save it as a data file
# UPLDCUSTDATA = Upload customer metadata and test data.
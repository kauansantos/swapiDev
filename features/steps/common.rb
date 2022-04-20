# General

def log_util(message)
  #força encoding para UTF-8
  if message.encoding.to_s != "UTF-8"
    log_util("RED-FIVE: #{Time.now} - Foi retornado um encoding diferente de UTF-8")
    message = message.to_s.force_encoding("UTF-8")
  end
  log = File.new('evidence_temp.txt', 'a')
  $world.puts("\n #{message} \n")
  begin
    log.write("\n #{message} \n")
  rescue => exception_log
    puts("SWAPI DEV: Exceção ao gravar log: #{exception_log}")
    log.write("\n #{message} \n")
  end
  log.close
end

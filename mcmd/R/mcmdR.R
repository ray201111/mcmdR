
library(data.table)
.mcmd_path = "/usr/local/tool/mcmd/bin/"

mcmd.set_mcmd_path <- function(mcmd_path){ .mcmd_path <<- mcmd_path }
mcmd.get_mcmd_path <- function(){ return(.mcmd_path) }


.Mcmd.CreateDirIfNotExist <- function(dir_path){
  if(!file.exists(dir_path)){
    dir.create(dir_path, recursive = T, mode = "0777")
    system(paste("chmod 777 ", dir_path))
    Sys.sleep(1)
  }
}

#******************************************************************************
#* 概要   | 指定したコマンドを実行                                            *
#* 詳細   |                                                                   *
#******************************************************************************
mcmd.exec_command <- function(string_command, out_file = ""){
  
  # out_fileに入力があれば、ファイル出力モード
  is_output_mode <- !(out_file == "")
  
  # ファイル出力モードのときは、出力先フォルダを作成
  if(is_output_mode){    
    .Mcmd.CreateDirIfNotExist(dirname(out_file))    
  }
  
  string_command <- paste(string_command, sep="", collapse=" ")
  
  # 実行するコマンド生成
  if(is_output_mode){
    string_command <- paste0("PATH=\"$PATH:", .mcmd_path, "\"
                             ",string_command, " > ", out_file)
  }else{
    # 改行を空白に置き換え
    string_command <- paste0("PATH=\"$PATH:", .mcmd_path, "\" ",string_command)
  }
  
  e <- try({
    # ファイル出力モードの時はNULLを、そうでないときは結果を返す
    if(is_output_mode){
      res <- system(string_command)
      return(res == 0)
    }else{
      result_data <- fread(string_command)
      
      return(result_data)      
    }
  })
  
  if (class(e) == "try-error") {
    return(F)
  }   
}


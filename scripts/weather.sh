#!/bin/bash

key=$1
city=$2 
url="http://api.openweathermap.org/data/2.5/weather?id=${city}&APPID=${key}&units=metric"

prnt () {
  # get the weather info from openweathermap
  wthr=$(wget -qO- "${url}")

  # current weather status
  stat=$(echo "${wthr}" | grep -o -e '\"main\":\"[a-Z]*\"' | awk -F ':' '{print $2}' | tr -d '"')
  # current temperature
  temp=$(echo "${wthr}" | grep -o -e '\"temp\":\-\?[0-9]*' | awk -F ':' '{print $2}' | tr -d '"')

  # clear screen
  echo -e "\033[2J\033[1;1H"

  if [[ "$stat" = *Clear* ]]; then
  	read -rd '' smbl << 'EOF'
  \033[1;33m
                          NN
                         h++h
                myymN   m++++m   Nmyym
                m++++shh++++++hhs++++m
                 s++++++oooooo++++++s
           NNNNNNy+++sddmmddmmdds+++yNNNNNN
           sooo++++smNhs++++++shNms++++ooos
           dyo++++s do++++++++++od s++++oyd \033[1;34m          ~ clear\033[1;33m
             Nh+++d o++++++++++++o d+++hN \033[1;34m            ~ ||temp||C\033[1;33m
             Nh+++d o++++++++++++o d+++hN
           dyo++++s do++++++++++od s++++oyd
           sooo++++smNhs++++++shNms++++ooos
           NNNNNNy+++sddmmddmmdds+++yNNNNNN
                 s++++++oooooo++++++s
                m++++shh++++++hhs++++m
                myymN   m++++m   Nmyym
                         h++h
                          NN
EOF
  a="${smbl/||temp||/$temp}"
  echo -e "${a}"
  elif [[ "$stat" = *Rain* ]]; then
  	read -rd '' smbl << 'EOF'
  \033[0;34m

  	                NyooyN
                        myhhym
                 NmdhyyssssssssyyhdmN
              NdysoooooooooooooooooosydN
          N dyooooooooooooooooooooooooooyd N
         NmyooooooooooooooooooooooooooooooymN
         hsoooooooooooooooooooooooooooooooooh
        hosyhddhysooooosyyyyyysooooosyhddhysoh \033[1;34m       ~ raining\033[0;34m
        ddN      NhsosdNNssssNNdsoshN      Ndd \033[1;34m       ~ ||temp||C\033[0;34m
                   mhm  NooooN  mhm
                        NooooN
                 NNN    NooooN
                msssh   NooooN
                dooosmNNhooosN
                NhoooossooosmN
                  NhsooosydN
                      N
EOF
  a="${smbl/||temp||/$temp}"
  echo -e "${a}"
  elif [[ "$stat" = *Drizzle ]]; then
  	read -rd '' smbl << 'EOF'
  \033[0;34m

  	                NyooyN
                        myhhym
                 NmdhyyssssssssyyhdmN
              NdysoooooooooooooooooosydN
          N dyooooooooooooooooooooooooooyd N
         NmyooooooooooooooooooooooooooooooymN
         hsoooooooooooooooooooooooooooooooooh
        hosyhddhysooooosyyyyyysooooosyhddhysoh \033[1;34m       ~ drizzling\033[0;34m
        ddN      NhsosdNNssssNNdsoshN      Ndd \033[1;34m       ~ ||temp||C\033[0;34m
                   mhm  NooooN  mhm
                        NooooN
                 NNN    NooooN
                msssh   NooooN
                dooosmNNhooosN
                NhoooossooosmN
                  NhsooosydN
                      N
EOF
  a="${smbl/||temp||/$temp}"
  echo -e "${a}"
  elif [[ "$stat" = *Thunderstorm* ]]; then
  	read -rd '' smbl << 'EOF'
   \033[1;33m
                   NN       NN
                  h//////////:s
                  s:::::::::::h
                  +::::::::::o
                 N:::::::::::m
                 h::::::::::oNNNNNNNN
                 o:::::::::://///////h
                 /::::::::::::::::::om         \033[1;34m       ~ storming\033[1;33m
                d::::::::::::::::::y           \033[1;34m       ~ ||temp||C\033[1;33m
                h/////////:::::::/h
                 NNNNNNNNy::::::/d
                         /:::::+m
                        h:::::oN
                        +::::y
                       h:::/h
                      N+::/m
                      m/:+m
                        N
EOF
  a="${smbl/||temp||/$temp}"
  echo -e "${a}"
  elif [[ "$stat" = *Cloud* ]]; then
  	read -rd '' smbl << 'EOF'
  \033[0;37m


  	                   NNNN
                Ndyo+++++oshm
              Nh+++++++++++++oyN NNNNN
            Nmo++++++++++++++++oso+++osm
            d+++++++++++++++++++++++++++sm
            s++++++++++++++++++++++++++++y
         Ndy+++++++++++++++++++++++++++++s
       Nho++++++++++++++++++++++++++++++++sydN \033[1;34m       ~ cloudy\033[0;37m
      ms+++++++++++++++++++++++++++++++++++++sm\033[1;34m       ~ ||temp||C\033[0;37m
      s++++++++++++++++++++++++++++++++++++++++h
      ++++++++++++++++++++++++++++++++++++++++++
      s++++++++++++++++++++++++++++++++++++++++o
      mo+++++++++++++++++++++++++++++++++++++++h
       Nho+++++++++++++++++++++++++++++++++++smN
         Ndyo+++++++++++++++++++++++++++++oym
              NN                       NN
EOF
  a="${smbl/||temp||/$temp}"
  echo -e "${a}"
  elif [[ "$stat" = *Snow* ]]; then
  	read -rd '' smbl << 'EOF'
  \033[1;36m
                          NN
                         N++N
                     ysh  ++  hsy
                NyyN my+sm++ms+ym NyyN
            NdN  y+h   Nyo++oyN   h+y  NdN
            hooshdo+N    m++m    N+odhsooh
              mhs+++sm    ++    ms+++shm
            hssssosysosymN++Nmysosysossssh     \033[1;34m       ~ snowing\033[1;36m
            mhmNN    Nmhso++oshmN    NNmhm     \033[1;34m       ~ ||temp||C\033[1;36m
            mhmNN    Nmhso++oshmN    NNmhm
            hssssosysosymN++Nmysosysossssy
              mhs+++sm    ++    ms+++shm
            hooshdo+N    m++m    N+odhsooh
            NdN  y+h   Nyo++oyN   h+y  NdN
                NyyN my+sm++ms+ym NyyN
                     ysh  ++  hoy
                         N++N
                          NN
EOF
  a="${smbl/||temp||/$temp}"
  echo -e "${a}"
  elif [[ "$stat" = *Fog* ]]; then
    read -rd '' smbl << 'EOF'
  \033[1;35m




                 NNNNN
              mhysssssshdm            NNNNN
            myooooooooooooym         dsssssd   \033[1;34m       ~ foggy\033[1;35m
          NhoooooosssooooooshN       hoooooy   \033[1;34m       ~ ||temp||C\033[1;35m     
          dooooosdNNNmyoooooosm      yoooooy
          yoooooy      msooooooymNNNdsoooooh
          yoooooh       NhsoooooosssoooooohN
          dsssssd         myooooooooooooyd N
           NNNNN            Ndyyssssyyhm
                                NNNNNNN




EOF
  a="${smbl/||temp||/$temp}"
  echo -e "${a}"
  elif [[ "$stat" = *Mist* ]]; then
    read -rd '' smbl << 'EOF'
  \033[1;35m




                 NNNNN
              mhysssssshdm            NNNNN
            myooooooooooooym         dsssssd   \033[1;34m       ~ misty\033[1;35m
          NhoooooosssooooooshN       hoooooy   \033[1;34m       ~ ||temp||C\033[1;35m     
          dooooosdNNNmyoooooosm      yoooooy
          yoooooy      msooooooymNNNdsoooooh
          yoooooh       NhsoooooosssoooooohN
          dsssssd         myooooooooooooyd N
           NNNNN            Ndyyssssyyhm
                                NNNNNNN



EOF
  a="${smbl/||temp||/$temp}"
  echo -e "${a}"
  fi
}

while true; do
  prnt
  sleep 10
done
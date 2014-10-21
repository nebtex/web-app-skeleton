module.exports =
  title: "2 online users a public chanel"
  description: "Test the channel bar behavior when there are 2 online users and a public channel"
  $app_state:
    name: "mercury-chat-app"
    logo: "img/logo.png"
    is_logged: true
    $current_user:
      user_id: "2"
    $users:
      $0:
        name: "blood_seeker"
        online: true
      $1:
        name: "invoker"
        online: true
      $2:
        name: "tester"
        online: true
      length: 3
    $public_channels:
      $0:
        name: "#General"
        $messages:
          $0:
            content: "The vital liquor of each vein I open flows to the Flayed Twins."
            user_id: "0"
            timestamp: 1409182953832
          $1:
            content: "All can be known, and known by me.."
            user_id: "1"
            timestamp: 1409182957832
          $1:
            content: "Guys just relax."
            user_id: "2"
            timestamp: 1409184233088
          length: 3
      length: 1
    $p2p_channels:
      $0_2:
        $messages:
          $messages:
            $0:
              content: "You have…blood on your hands."
              user_id: "0"
              timestamp: 1409184021562
            length: 1
      length: 1
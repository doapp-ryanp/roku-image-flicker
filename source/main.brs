sub Main()
' THIS does NOT cause flicker
'  background = {
'        Color: "#000000"
'    }
'    loadingImage = {
'        Url: "pkg:/images/splash-screen_hd.png"
'        TargetRect: {
'            x: 0,
'            y: 0,
'            w: 1280,
'            h: 720
'        }
'    }
'    loadingText = {
'        Text: "Loading...",
'        TextAttrs: {
'            Font: "Large",
'            VAlign: "Top"
'        },
'        TargetRect: {
'            x: loadingImage.TargetRect.x,
'            y: loadingImage.TargetRect.y + 25,
'            w: loadingImage.TargetRect.w,
'            h: 30
'        }
'    }
'    canvas = CreateObject( "roImageCanvas" )
'    canvas.SetLayer( 0, [ background, loadingImage, loadingText ] )
'    canvas.Show()  
  
  showChannelSGScreen()
  
  canvas.Hide()
end sub

sub showChannelSGScreen()
  screen = CreateObject("roSGScreen")
  m.port = CreateObject("roMessagePort")
  screen.setMessagePort(m.port)
  scene = screen.CreateScene("ZORenderablesExample")
  screen.show()

  while(true)
    msg = wait(0, m.port)
    msgType = type(msg)

    if msgType = "roSGScreenEvent"
      if msg.isScreenClosed() then return
    end if
  end while

end sub

this.App.home = (()=>
  $(".menu").click(()->
    $(this).children(".menu-bar1").toggleClass("menuclick1")
    $(this).children(".menu-bar2").toggleClass("menuclick2")
    $(this).children(".menu-bar3").toggleClass("menuclick3")
  )

  $("ul.nav-tabs li a").each(()->
    $(this).on("click", ()->
      $(this).parent().parent().each ()->
        $(this).children(".menu").remove()

      ham = $("<div></div>", { class: "menu" })
      for i in [1..3]
        ham.append $("<div></div>", { class: "menu-bar#{i}" })
      $(this).parent().prepend(ham)
    )
  ))()

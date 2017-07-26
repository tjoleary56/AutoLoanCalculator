
library(shiny)

shinyServer(function(input, output) {
  
  totalval = reactive({
    tv = input$sp + input$w + input$gi + input$c1v + input$c2v + input$c3v + input$c4v
    tv
  })
  
  totalvalwtax = reactive({
    tvt = totalval() + input$tax*totalval()
    tvt
  })
  
  amountFinanced = reactive({
    financed = totalvalwtax() - input$cashDown - (input$tradeval - input$tradepayoff)
    financed
  })
  
  
  r = reactive({
    rrr = input$apr/12
    rrr
  })
  
  monthlyPayment = reactive({
    monthly = amountFinanced() * (r()*(1+r())^input$contract)/(((1+r())^input$contract) - 1) ## A = P * (r(1+r)^n)/((1+r)^(n) -1)
    monthly                                                                                  ## A = monthly payment, P = principal, r = apr/12, n = contract term in months
  })

  financeCharge = reactive({
    fc = monthlyPayment()*input$contract - amountFinanced()
    fc
  })
  
  netDown = reactive({
    nd = input$tradeval + input$cashDown - input$tradepayoff
    nd
  })
  
  totalPrice = reactive({
    totp = amountFinanced() + financeCharge() - netDown()
    totp
  })
  

output$pricing = renderTable({
  yo = data.frame(c("Sticker Price", "Warranty", "Gap Insurance", "State Sales Tax Rate", "Trade Value", "Trade Payoff", "Cash Down", "Contract Term", "APR Rate", input$c1t, input$c2t, input$c3t, input$c4t),
                  c(input$sp, input$w, input$gi, input$tax, input$tradeval, input$tradepayoff, input$cashDown, input$contract, input$apr, input$c1v, input$c2v, input$c3v, input$c4v))
  
  colnames(yo) = c("Item", "Amount")
  yo
})

output$results = renderTable({
  tato = data.frame(c("Total Sales Price(excluding sales tax)", "Totals Sales Price(including sales tax)", "Amount Financed", "Monthly Payment", "Finance Charge", "Net Down Payment", "Total Price"),
                    c(totalval(), totalvalwtax(), amountFinanced(), monthlyPayment(), financeCharge(), netDown(), totalPrice()))
  
  colnames(tato) = c("Results", "Amount")
  tato
})


  
})

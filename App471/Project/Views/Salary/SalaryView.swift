//
//  SalaryView.swift
//  App471
//
//  Created by IGOR on 16/04/2024.
//

import SwiftUI

struct SalaryView: View {

    @StateObject var viewModel = SalaryViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Dashboard")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.bottom, 30)
                    .padding()
                                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        HStack {
                            
                            Text("Your salary")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isEditSalary = true
                                }
                                
                            }, label: {
                                
                                Text("Edit")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .medium))
                            })
                        }
                        
                        Text("$\(viewModel.salary)")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .semibold))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    .padding(.horizontal)

                if viewModel.payments.isEmpty {
                    
                    VStack(spacing: 15) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .semibold))
                        
                        Text("Add your payouts in currencies")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddPayments = true
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                                .frame(width: 150, height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    HStack {
                        
                        Text("Amount of payments in currencies")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()

                    }
                    .padding()
                
                    ScrollView(.vertical,showsIndicators: false) {
                        
                        LazyVStack(spacing: 15) {
                            
                            ForEach(viewModel.payments, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedPayment = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDelete = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(spacing: 18) {
                                        
                                        HStack {
                                            
                                            Text(index.payCurrency ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
                                            
                                            Spacer()
                                            
                                            Text(index.payAmount ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
                                        }
                                        
                                        Rectangle()
                                            .fill(.gray)
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                    }
                                })
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    }
                    .padding()
                }
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAddPayments = true
                    }
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color("prim"))
                })
                .opacity(viewModel.payments.isEmpty ? 0 : 1)
                .disabled(viewModel.payments.isEmpty ? true : false)
             }
        }
        .onAppear {
            
            viewModel.fetchPayments()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddPayments ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddPayments  = false
                        }
                    }
                
                VStack(spacing: 8) {
                    
                    Text("Adding an amount")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                        .padding(.bottom, 20)
                    
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Currency selection")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 13, weight: .regular))
                            
                            Menu(content: {
                                
                                ForEach(viewModel.currencies, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentCurrency = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentCurrency.isEmpty {
                                    
                                    HStack {
                                        
                                        Text("Choose")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                        
                                    }
                                    
                                } else {
                                    
                                    HStack {
                                        
                                        Text(viewModel.currentCurrency)
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                        
                                    }
                                }
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.05)))
                            
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Amount of payments")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 13, weight: .regular))
                            
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("$0.00")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.payAmount.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.payAmount)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.05)))
                        }
                        .padding(.bottom)
                    
                    Button(action: {
                        
                        viewModel.payCurrency = viewModel.currentCurrency
                        
                        viewModel.addPayment()
                        
                        viewModel.payAmount = ""
                        viewModel.currentCurrency = ""
                        
                        viewModel.fetchPayments()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddPayments = false
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .opacity(viewModel.currentCurrency.isEmpty || viewModel.payAmount.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.currentCurrency.isEmpty || viewModel.payAmount.isEmpty ? true : false)
                    .padding(.vertical)
                    .padding(.bottom, 200)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAddPayments  ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isEditSalary ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEditSalary = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditSalary = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Editing the diagram plan")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Task plan")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.editSalary.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.editSalary)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.white))

                    Button(action: {
                        
                        viewModel.salary = viewModel.editSalary
          
                        withAnimation(.spring()) {
                            
                            viewModel.isEditSalary = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.blue)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEditSalary = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.blue)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                .padding()
                .offset(y: viewModel.isEditSalary ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deletePayment(withPayAmount: viewModel.selectedPayment?.payAmount ?? "", completion: {
                            
                            viewModel.fetchPayments()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.blue)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.black))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SalaryView()
}

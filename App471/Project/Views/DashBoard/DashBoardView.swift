//
//  DashBoardView.swift
//  App471
//
//  Created by IGOR on 16/04/2024.
//

import SwiftUI

struct DashBoardView: View {
    
    @StateObject var viewModel = DashBoardViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Dashboard")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        Text("Task plan diagram")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditDiagram = true
                                
                            }
                            
                        }, label: {
                            
                            Text("Edit data")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .medium))
                                .frame(width: 100, height: 40)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    
                    VStack {
                        
                        ZStack {
                            
                            Circle()
                                .stroke(Color.white.opacity(0.2), lineWidth: 10)
                                .frame(width: 200)
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(calculatePercentage() / 100))
                                .stroke(Color("join"), lineWidth: 10)
                                .frame(width: 200)
                                .rotationEffect(.degrees(-90))
                            
                            VStack(spacing: 5) {
                                
                                Text("Task plan")
                                    .foregroundColor(.white.opacity(0.8))
                                    .font(.system(size: 16, weight: .semibold))
                                
                                    
                                    Text("\(String(format: "%.f", viewModel.taskPlanKrug))/\(String(format: "%.f", viewModel.tasksAccKrug))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .semibold))
                   
                            }
                        }
                    }
                    .padding()
                    
                    HStack {
                        
                        Text("Basic data")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddBasicData = true
                            }
                            
                        }, label: {
                            
                            Text("Edit")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .medium))
                        })
                    }
                    .padding(.vertical)
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Tasks accomplished")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("\(viewModel.tasksAcc)")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Active tasks")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("\(viewModel.activeTasks)")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Total earned")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                        Text("\(viewModel.totalEarned)")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddBasicData ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddBasicData  = false
                        }
                    }
                
                VStack(spacing: 8) {
                    
                    Text("Editing basic data")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                        .padding(.bottom, 20)
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Tasks accomplished")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 13, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("0")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.ta.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.ta)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.05)))
                            
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Active tasks")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 13, weight: .regular))
                            
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("0")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.at.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.at)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.05)))
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Total earned")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 13, weight: .regular))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("$0.00")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.te.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.te)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.05)))
                        
                    }
                    
                    Button(action: {
                        
                        viewModel.tasksAcc = viewModel.ta
                        viewModel.activeTasks = viewModel.at
                        viewModel.totalEarned = viewModel.te
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddBasicData = false
                        }
                        
                    }, label: {
                        
                        Text("Save data")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .opacity(viewModel.ta.isEmpty || viewModel.at.isEmpty || viewModel.te.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.ta.isEmpty || viewModel.at.isEmpty || viewModel.te.isEmpty ? true : false)
                    .padding(.vertical)
                    .padding(.bottom, 200)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAddBasicData  ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isEditDiagram ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEditDiagram = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditDiagram = false
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
                            .opacity(viewModel.TPK.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.TPK)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.white))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Tasks accomplished")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.TAK.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.TAK)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.white))
                    
                    Button(action: {
                        
                        viewModel.taskPlanKrug = Double(viewModel.TPK) ?? 0
                        viewModel.tasksAccKrug = Double(viewModel.TAK) ?? 0.001
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEditDiagram = false
                            
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
                            
                            viewModel.isEditDiagram = false
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
                .offset(y: viewModel.isEditDiagram ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
    
    func calculatePercentage() -> Double {
        
        let value = viewModel.taskPlanKrug
        let maxValue = viewModel.tasksAccKrug
        
        let percentCircle = (value / maxValue) * 100
        
        return percentCircle
    }
}

#Preview {
    DashBoardView()
}

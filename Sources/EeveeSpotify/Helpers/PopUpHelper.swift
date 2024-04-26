import UIKit
import Orion
import Foundation

class PopUpHelper {

    private static var isPopUpShowing = false
    
    static let sharedPresenter = type(
        of: Dynamic.SPTEncorePopUpPresenter
        .alloc(interface: SPTEncorePopUpPresenter.self)
    )
    .shared()

    static func showPopUp(
        message: String,
        buttonText: String
    ) {

        if isPopUpShowing {
            return
        }

        let model = Dynamic.SPTEncorePopUpDialogModel
            .alloc(interface: SPTEncorePopUpDialogModel.self)
            .initWithTitle(
                "EeveeSpotify",
                description: message,
                image: nil,
                primaryButtonTitle: buttonText,
                secondaryButtonTitle: nil
            )

        let dialog = Dynamic.SPTEncorePopUpDialog
            .alloc(interface: SPTEncorePopUpDialog.self)
            .`init`()
        
        dialog.update(model)
        dialog.setEventHandler({ 
            sharedPresenter.dismissPopupWithAnimate(true, clearQueue: false, completion: nil)
            isPopUpShowing.toggle()
        })

       sharedPresenter.presentPopUp(dialog)
       isPopUpShowing.toggle()
    }
}
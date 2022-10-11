import { Component } from '@angular/core';
import { MsalService } from '@azure/msal-angular';
import { AuthenticationResult } from '@azure/msal-browser';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'SSO-Project';

  constructor(private _msalService: MsalService) { }

  isLogedIn() {
    let x;
     x = this._msalService.instance.getActiveAccount() != null;
    //  console.log("xxxxx:-",x);
     return x;
  }

  login() {
    this._msalService.loginPopup().subscribe((response: AuthenticationResult)=>{
      this._msalService.instance.setActiveAccount(response.account);
      console.log("inside:p",response);
    },(error)=>{
      console.log("erroe:--",error)
    })
  }

  logout() {
    this._msalService.logout();
  }

}

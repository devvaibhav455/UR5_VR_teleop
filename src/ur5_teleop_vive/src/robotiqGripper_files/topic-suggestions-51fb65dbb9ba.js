"use strict";(globalThis.webpackChunk=globalThis.webpackChunk||[]).push([["topic-suggestions","app_assets_modules_github_fetch_ts"],{34892:(e,t,n)=>{n.d(t,{DF:()=>p,Fr:()=>m,a_:()=>d});var r=n(67525);function o(e){let t=[...e.querySelectorAll("meta[name=html-safe-nonce]")].map(e=>e.content);if(t.length<1)throw Error("could not find html-safe-nonce on document");return t}let s=class ResponseError extends Error{constructor(e,t){super(`${e} for HTTP ${t.status}`),this.response=t}};function a(e,t,n=!1){let r=t.headers.get("content-type")||"";if(!n&&!r.startsWith("text/html"))throw new s(`expected response with text/html, but was ${r}`,t);if(n&&!(r.startsWith("text/html")||r.startsWith("application/json")))throw new s(`expected response with text/html or application/json, but was ${r}`,t);let o=t.headers.get("x-html-safe");if(o){if(!e.includes(o))throw new s("response X-HTML-Safe nonce did not match",t)}else throw new s("missing X-HTML-Safe nonce",t)}var i=n(22490),c=n(7180);let l="server-x-safe-html",u=i.Z.createPolicy(l,{createHTML:(e,t)=>c.O.apply({policy:()=>(a(o(document),t),e),policyName:l,fallback:e,silenceErrorReporting:!0})});async function d(e,t,n){let o=new Request(t,n);o.headers.append("X-Requested-With","XMLHttpRequest");let s=await self.fetch(o);if(s.status<200||s.status>=300)throw Error(`HTTP ${s.status}${s.statusText||""}`);let a=u.createHTML(await s.text(),s);return(0,r.r)(e,a)}function p(e,t,n=1e3,r=[200]){return async function n(o){let s=new Request(e,t);s.headers.append("X-Requested-With","XMLHttpRequest");let a=await self.fetch(s);if(202===a.status)return await new Promise(e=>setTimeout(e,o)),n(1.5*o);if(r.includes(a.status))return a;if(a.status<200||a.status>=300)throw Error(`HTTP ${a.status}${a.statusText||""}`);throw Error(`Unexpected ${a.status} response status from poll endpoint`)}(n)}async function m(e,t,n){let{wait:r=500,acceptedStatusCodes:o=[200],max:s=3,attempt:a=0}=n||{},i=async()=>new Promise((n,i)=>{setTimeout(async()=>{try{let r=new Request(e,t);r.headers.append("X-Requested-With","XMLHttpRequest");let i=await self.fetch(r);if(o.includes(i.status)||a+1===s)return n(i);n("retry")}catch(e){i(e)}},r*a)}),c=await i();return"retry"!==c?c:m(e,t,{wait:r,acceptedStatusCodes:o,max:s,attempt:a+1})}},67525:(e,t,n)=>{n.d(t,{r:()=>i});var r=n(22490),o=n(7180);let s="parse-html-no-op",a=r.Z.createPolicy(s,{createHTML:e=>o.O.apply({policy:()=>e,policyName:s,fallback:e,sanitize:!1,fallbackOnError:!0})});function i(e,t){let n=e.createElement("template");return n.innerHTML=a.createHTML(t),e.importNode(n.content,!0)}},29352:(e,t,n)=>{var r=n(34892),o=n(59753),s=n(65935);function a(e){let t=e.querySelector(".js-topic-suggestions-box"),n=t.querySelector(".js-topic-suggestion");n||t.remove()}function i(e){let t=e.closest(".js-topic-save-notice-container"),n=t.querySelector(".js-repo-topics-save-notice");n.classList.remove("d-none"),n.classList.add("d-inline-block","anim-fade-in"),setTimeout(()=>{n.classList.remove("d-inline-block"),n.classList.add("d-none")},1900)}async function c(e){let t=e.querySelector(".js-topic-suggestions-container");if(!t)return;let n=t.getAttribute("data-url");if(!n)throw Error("could not get url");let o=await (0,r.a_)(document,n);t.textContent="",t.appendChild(o)}(0,o.on)("click",".js-accept-topic-button",function(e){let t=e.currentTarget,n=t.closest(".js-topic-form-area"),r=t.closest(".js-topic-suggestion"),o=n.querySelector(".js-template"),s=n.querySelector(".js-tag-input-selected-tags"),i=o.cloneNode(!0),c=t.getAttribute("data-topic-name")||"";i.querySelector("input").value=c,i.querySelector(".js-placeholder-tag-name").replaceWith(c),i.classList.remove("d-none","js-template"),s.appendChild(i),r.remove(),a(n)}),(0,s.AC)(".js-accept-topic-form",async function(e,t){await t.html();let n=e.closest(".js-topic-form-area"),r=e.closest(".js-topic-suggestion"),o=n.querySelector(".js-template"),s=n.querySelector(".js-tag-input-selected-tags"),l=o.cloneNode(!0),u=r.querySelector('input[name="input[name]"]').value;l.querySelector("input").value=u,l.querySelector(".js-placeholder-tag-name").replaceWith(u),l.classList.remove("d-none","js-template"),s.appendChild(l),r.remove(),c(n),a(n),i(e)}),(0,o.on)("click",".js-decline-topic-button",function(e){let t=e.currentTarget,n=t.closest(".js-topic-form-area"),r=t.closest(".js-topic-suggestion");setTimeout(()=>{r.remove(),a(n)},0)}),(0,s.AC)(".js-decline-topic-form",async function(e,t){await t.html(),i(e);let n=e.closest(".js-topic-form-area"),r=e.closest(".js-topic-suggestion");r.remove(),c(n),a(n)})},89359:(e,t,n)=>{function r(e){let t=document.querySelectorAll(e);if(t.length>0)return t[t.length-1]}function o(){let e=r("meta[name=analytics-location]");return e?e.content:window.location.pathname}function s(){let e=r("meta[name=analytics-location-query-strip]"),t="";e||(t=window.location.search);let n=r("meta[name=analytics-location-params]");for(let e of(n&&(t+=(t?"&":"?")+n.content),document.querySelectorAll("meta[name=analytics-param-rename]"))){let n=e.content.split(":",2);t=t.replace(RegExp(`(^|[?&])${n[0]}($|=)`,"g"),`$1${n[1]}$2`)}return t}function a(){return`${window.location.protocol}//${window.location.host}${o()+s()}`}n.d(t,{S:()=>a})},24601:(e,t,n)=>{n.d(t,{aJ:()=>E,cI:()=>T,eK:()=>w});var r=n(82918),o=n(83314),s=n(28382),a=n(89359),i=n(68202),c=n(53729),l=n(86283),u=n(46426);let d=!1,p=0,m=Date.now(),f=new Set(["Failed to fetch","NetworkError when attempting to fetch resource."]);function h(e){return e instanceof Error||"object"==typeof e&&null!==e&&"name"in e&&"string"==typeof e.name&&"message"in e&&"string"==typeof e.message}function y(e){return!!("AbortError"===e.name||"TypeError"===e.name&&f.has(e.message)||e.name.startsWith("ApiError")&&f.has(e.message))}function w(e,t={}){if((0,u.c)("FAILBOT_HANDLE_NON_ERRORS")){if(!h(e)){let n=Error(),r={type:"UnknownError",value:`Unable to report error, due to a thrown non-Error type: ${typeof e}`,stacktrace:T(n)};g(S(r,t));return}y(e)||g(S(_(e),t))}else y(e)||g(S(_(e),t))}async function g(e){if(!q())return;let t=document.head?.querySelector('meta[name="browser-errors-url"]')?.content;if(t){if(v(e.error.stacktrace)){d=!0;return}p++;try{await fetch(t,{method:"post",body:JSON.stringify(e)})}catch{}}}function _(e){return{type:e.name,value:e.message,stacktrace:T(e)}}function S(e,t={}){return Object.assign({error:e,sanitizedUrl:(0,a.S)()||window.location.href,readyState:document.readyState,referrer:(0,i.wP)(),timeSinceLoad:Math.round(Date.now()-m),user:E()||void 0,bundler:c.A7,ui:Boolean(document.querySelector('meta[name="ui"]'))},t)}function T(e){return(0,s.Q)(e.stack||"").map(e=>({filename:e.file||"",function:String(e.methodName),lineno:(e.lineNumber||0).toString(),colno:(e.column||0).toString()}))}let b=/(chrome|moz|safari)-extension:\/\//;function v(e){return e.some(e=>b.test(e.filename)||b.test(e.function))}function E(){let e=document.head?.querySelector('meta[name="user-login"]')?.content;if(e)return e;let t=(0,r.b)();return`anonymous-${t}`}let j=!1;function q(){return!j&&!d&&p<10&&(0,o.Gb)()}if(l.iG?.addEventListener("pageshow",()=>j=!1),l.iG?.addEventListener("pagehide",()=>j=!0),"function"==typeof BroadcastChannel){let e=new BroadcastChannel("shared-worker-error");e.addEventListener("message",e=>{w(e.data.error)})}},95253:(e,t,n)=>{let r;n.d(t,{Y:()=>p,q:()=>m});var o=n(88149),s=n(86058),a=n(44544),i=n(71643);let{getItem:c}=(0,a.Z)("localStorage"),l="dimension_",u=["utm_source","utm_medium","utm_campaign","utm_term","utm_content","scid"];try{let e=(0,o.n)("octolytics");delete e.baseContext,r=new s.R(e)}catch(e){}function d(e){let t=(0,o.n)("octolytics").baseContext||{};if(t)for(let[e,n]of(delete t.app_id,delete t.event_url,delete t.host,Object.entries(t)))e.startsWith(l)&&(t[e.replace(l,"")]=n,delete t[e]);let n=document.querySelector("meta[name=visitor-payload]");if(n){let e=JSON.parse(atob(n.content));Object.assign(t,e)}let r=new URLSearchParams(window.location.search);for(let[e,n]of r)u.includes(e.toLowerCase())&&(t[e]=n);return t.staff=(0,i.B)().toString(),Object.assign(t,e)}function p(e){r?.sendPageView(d(e))}function m(e,t={}){let n=document.head?.querySelector('meta[name="current-catalog-service"]')?.content,o=n?{service:n}:{};for(let[e,n]of Object.entries(t))null!=n&&(o[e]=`${n}`);r&&(d(o),r.sendEvent(e||"unknown",d(o)))}},7180:(e,t,n)=>{n.d(t,{O:()=>u,d:()=>TrustedTypesPolicyError});var r=n(46426),o=n(71643),s=n(24601),a=n(27856),i=n.n(a),c=n(95253);let TrustedTypesPolicyError=class TrustedTypesPolicyError extends Error{};function l({policy:e,policyName:t,fallback:n,fallbackOnError:a=!1,sanitize:l,silenceErrorReporting:u=!1}){try{if((0,r.c)("BYPASS_TRUSTED_TYPES_POLICY_RULES"))return n;let o=e();return l&&new Promise(e=>{let n=window.performance.now(),r=i().sanitize(o),s=o.replace(/\n/g," ").split(" "),a=r.replace(/\n/g," ").split(" "),l=s.filter(e=>!a.includes(e)),u=window.performance.now();o!==r&&((0,c.q)("trusted_types_policy.sanitize",{policyName:t,policyOutput:o,diffTokens:l.toString(),executionTime:u-n}),e(o))}),o}catch(e){if(e instanceof TrustedTypesPolicyError||(u||(0,s.eK)(e),(0,o.b)({incrementKey:"TRUSTED_TYPES_POLICY_ERROR",trustedTypesPolicyName:t}),!a))throw e}return n}let u={apply:l}},22490:(e,t,n)=>{n.d(t,{Z:()=>i});var r=n(86283);function o(e){return()=>{throw TypeError(`The policy does not implement the function ${e}`)}}let s={createHTML:o("createHTML"),createScript:o("createScript"),createScriptURL:o("createScriptURL")},a={createPolicy:(e,t)=>({name:e,...s,...t})},i=globalThis.trustedTypes??a,c=!1;r.n4?.addEventListener("securitypolicyviolation",e=>{"require-trusted-types-for"!==e.violatedDirective||c||(console.warn(`Hi fellow Hubber!
    You're probably seeing a Report Only Trusted Types error near this message. This is intended behaviour, staff-only,
    does not impact application control flow, and is used solely for statistic collection. Unfortunately we
    can't gather these statistics without adding the above warnings to your console. Sorry about that!
    Feel free to drop by #pse-architecture if you have any additional questions about Trusted Types or CSP.`),c=!0)})}},e=>{var t=t=>e(e.s=t);e.O(0,["vendors-node_modules_dompurify_dist_purify_js","vendors-node_modules_stacktrace-parser_dist_stack-trace-parser_esm_js-node_modules_github_bro-a4c183","vendors-node_modules_github_remote-form_dist_index_js-node_modules_delegated-events_dist_inde-0e9dbe","ui_packages_soft-nav_soft-nav_ts"],()=>t(29352));var n=e.O()}]);
//# sourceMappingURL=topic-suggestions-47e25138c5bf.js.map